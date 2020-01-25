//
//  LSIArtistController.m
//  Favorite Artists
//
//  Created by macbook on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSIArtistController.h"
#import "LSIArtist.h"
#import "NSJSONSerialization+LSIYuorArtistModel.h"

// Declare here private properties
@interface LSIArtistController ()

@property NSMutableArray *internalFavArtists;
@property NSDictionary *artistsDictionary;  // no

@end

@implementation LSIArtistController

- (NSURL *)artistsFileURL {
    
    NSURL *documentDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSString *fileName = @"artists.json";
    return [documentDirectory URLByAppendingPathComponent:fileName];
}

// Computed property
- (NSArray *)favoriteArtists {
    return self.internalFavArtists;
}

static NSString *const baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

NSString *apiKey = @"1";

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalFavArtists = [[self loadArtistsFromURL] mutableCopy];
    }
    return self;
}

- (void)searchArtistWithSearchTerm:(NSString *)searchTerm
                        completion:(void (^)(NSError *error))completion {
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    urlComponents.queryItems = @[[NSURLQueryItem queryItemWithName:@"s" value:searchTerm]];
    NSLog(@"urlComponents before data task: %@",urlComponents);
    
    
    NSURL *url = urlComponents.URL;
    NSLog(@"URL before data task: %@",url.absoluteString);
    
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"Data: %@", data);
        
        if (error) {
            NSLog(@"NSURLsession.Error: %@", error);
            completion(error);
            return;
        }
        
        NSLog(@"Data: %@", data);
        
        NSError *jsonError = nil;
        NSError *noDictionaryError = nil;
        
        // Taking the JSON and turning it into an Artist
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSLog(@"json: %@",[json descriptionInStringsFileFormat]);
        NSLog(@"Data: %@", data);
        
        if (jsonError) {
            completion(nil);
            return;
        }
        
        NSLog(@"JSON: %@", json);
        if (![json isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a dictionary as expected");
            completion(noDictionaryError);
        }
        
        if (json[@"artists"] == [NSNull null]) {
            NSLog(@"Error: No artists found for search term: %@", searchTerm);
            completion(nil);
            return;
        }
        
        // getting the array "artists" from the json
        NSMutableArray *fetchedArtistInfo = json[@"artists"];
        
        for (NSDictionary *dictionary in fetchedArtistInfo) {
            LSIArtist *artist = [[LSIArtist alloc] initWithDictionary:dictionary];
            self.fetchedArtist = artist;
        }
        completion(nil);
    }];
    task.resume;
}

// MARK: CRUD
- (LSIArtist *)AddArtist:(LSIArtist *)artist {
    
    NSNumber *yearNumber = [NSNumber numberWithInt:artist.yearFormed];
    
    LSIArtist *newArtist = [[LSIArtist alloc]initWithName:artist.name biography:artist.biography yearFormed:[yearNumber intValue]];
    [self.internalFavArtists addObject:newArtist];
    [self saveArtistsToURL];
    return artist;
}

- (void)deleteArtist:(LSIArtist *)artist {
    
    LSIArtist *newArtist = [[LSIArtist alloc]initWithName:artist.name biography:artist.biography yearFormed:artist.yearFormed];
    
    [self.internalFavArtists removeObject:newArtist];
    [self saveArtistsToURL];
}

// MARK: Persistence

- (void)saveArtistsToURL {
    
    NSMutableArray *artistDictionaries = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < self.internalFavArtists.count; i++) {
        
        LSIArtist *artist = self.internalFavArtists[i];
        [artistDictionaries addObject: [artist putInDictionary]];
    }
    
    NSData *artistsData = [NSJSONSerialization dataWithJSONObject:artistDictionaries options:0 error:nil];
    
    [artistsData writeToURL:[self artistsFileURL] atomically:YES];
}

- (NSArray *)loadArtistsFromURL {
    
    NSData *artistsData = [NSData dataWithContentsOfURL:[self artistsFileURL]];
    
    if (!artistsData) { return @[]; }
    
    NSError *error = nil;
    
    NSArray *artistDictionaries = [NSJSONSerialization JSONObjectWithData:artistsData options:0 error:&error];
    
    if (error) {
        NSLog(@"Error loading saved artists: %@", error);
        return @[];
    }
    
    NSMutableArray *artists = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < artistDictionaries.count; i++) {
        
        NSDictionary *artistDictionary = artistDictionaries[i];
        LSIArtist *artist = [[LSIArtist alloc] initWithDictionary:artistDictionary];
        [artists addObject:artist];
    }
    return artists;
}

@end
