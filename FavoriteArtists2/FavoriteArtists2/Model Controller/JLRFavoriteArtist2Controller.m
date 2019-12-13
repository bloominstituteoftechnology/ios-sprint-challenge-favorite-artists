//
//  JLRFavoriteArtist2Controller.m
//  FavoriteArtists2
//
//  Created by Jesse Ruiz on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "JLRFavoriteArtist2Controller.h"
#import "JLRFavoriteArtists2+Convenience.h"
#import "JLRCoreDataStack.h"

@implementation JLRFavoriteArtist2Controller

static NSString *const baseURLString = @"https://www.theaudiodb.com/api/v1/json/1";

- (void)searchForArtistsWithSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray *artists, NSError *error))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *searchItem = [NSURLQueryItem queryItemWithName:@"search" value:searchTerm];
    [components setQueryItems:@[searchItem]];
    
    NSURL *url = [components URL];
    NSLog(@"URL: %@", url);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Search results");
        
        if (error) {
            completion(nil, error);
            return;
        }
        
        if (data == nil) {
            NSLog(@"Data was nil");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if(jsonError) {
            completion(nil, error);
            return;
        }
        
        if (![json isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a top level dictionary as expected");
            completion(nil, [[NSError alloc] init]);
        }
        
        NSArray *artistsArray = json[@"artists"];
        NSDictionary *artistDictionary = artistsArray[0];

        NSString *artistName = artistDictionary[@"strArtist"];
        NSDate *yearFormed = artistDictionary[@"intFormedYear"];
        NSString *artistBio = artistDictionary[@"strBiographyEN"];
        NSManagedObjectContext *moc = [[JLRCoreDataStack sharedStack] mainContext];

        Artist *favoriteArtist = [[Artist alloc] initWithName:artistName bio:artistBio formed:yearFormed context:moc];
        
        completion(favoriteArtist, nil);
    }];
    [task resume];
}

- (Artist *)createFavoriteArtistWithName:(NSString *)name bio:(NSString *)bio formed:(NSDate *)formed
{
    NSManagedObjectContext *moc = [[JLRCoreDataStack sharedStack] mainContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"FavoriteArtist" inManagedObjectContext:moc];
    Artist *artist = [[Artist alloc] initWithEntity:entity insertIntoManagedObjectContext:moc];
    artist.name = name;
    artist.bio = bio;
    artist.formed = formed;
    [self saveToPersistentStore];
    return artist;
}


- (void)deleteArtist:(Artist *)artist
{
    NSManagedObjectContext *moc = [[JLRCoreDataStack sharedStack] mainContext];
    [moc deleteObject:artist];
    [self saveToPersistentStore];
}

- (void)saveToPersistentStore
{
    NSError *error = nil;
    if (![[[JLRCoreDataStack sharedStack] mainContext] save:&error]) {
        NSLog(@"Error saving moc: %@", error);
    }
}


#pragma mark - Properties
- (NSArray *)artists
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"FavoriteArtist"];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:false];
    
    fetchRequest.sortDescriptors = @[sortDescriptor];
    
    NSManagedObjectContext *moc = [[JLRCoreDataStack sharedStack] mainContext];
    
    NSError *error = nil;
    
    NSArray *results = [moc executeFetchRequest:fetchRequest error:&error];
    if (!results) {
        NSLog(@"Error saving moc: %@", error);
    }
    return results;
}


@end
