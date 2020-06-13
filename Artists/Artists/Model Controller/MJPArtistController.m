//
//  MJPAristController.m
//  Artists
//
//  Created by Mark Poggi on 6/12/20.
//  Copyright © 2020 Mark Poggi. All rights reserved.
//

#import "MJPArtistController.h"

@implementation MJPArtistController

static NSString *baseURLString = @"https://theaudiodb.com/api/v1/json/1/search.php";

- (instancetype)init
{
    self = [super init];
    if (self) {
        _artists = [[NSMutableArray alloc]init];
    }
    return self;
}

- (NSArray *)savedArtists {
    return [self.artists copy];
}

- (void)createArtist:(MJPArtist *)artist
{
    [self.artists addObject:artist];
    [self saveToPersistentStore];
    NSLog(@"created artist");
}

- (void)deleteArtist:(MJPArtist *)artist
{
    [self.artists removeObject:artist];
    [self saveToPersistentStore];
    NSLog(@"deleted artist");
}

- (NSURL *)persistentFileURL {

    NSURL *documentDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSString *fileName = @"artists.json";
    return [documentDirectory URLByAppendingPathComponent:fileName];
}

- (void)saveToPersistentStore {
    NSError *saveError = nil;
    NSURL *url = [self persistentFileURL];
    NSMutableArray *artistsArray = [[NSMutableArray alloc] init];

    for (MJPArtist *artist in self.artists) {
        NSDictionary *artistDict = [artist toDictionary];
        [artistsArray addObject:artistDict];
    }
    NSDictionary *artistsDictionary = @{
        @"artists" : artistsArray
    };
    bool successfulSave = [artistsDictionary writeToURL:url error:nil];
    if (successfulSave) {
        NSLog(@"updated persistent store");
        return;
    } else {
        NSLog(@"Error saving artists: %@", saveError);
    }
}

- (void)loadfromPersistentStore {
    NSURL *url = [self persistentFileURL];

    NSDictionary *artistsDictionary = [NSDictionary dictionaryWithContentsOfURL:url];

    if (![artistsDictionary[@"artists"]  isEqual: @""]) {
        NSArray *artistDictionaries = artistsDictionary[@"artists"];
        for (NSDictionary *artistDictionary in artistDictionaries) {
            MJPArtist *artist = [[MJPArtist alloc] initWithDictionary:artistDictionary];
            [self.artists addObject:artist];
        }
    }
}

- (void)fetchArtist:(NSString *)name completionBlock:( MJPCompletionBlock)completionBlock;
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];

    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *searchTerm = [NSURLQueryItem queryItemWithName:@"s" value:name];
    components.queryItems = @[searchTerm];
    NSURL *url = components.URL;

    if (!url) {
        return;
    }
    NSURLSessionTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        if (error) {
            NSLog(@"Error getting artist information: %@", error);
            completionBlock(nil, error);
            return;
        }

        if (!data) {
            NSLog(@"No data returned");
            completionBlock(nil, nil);
            return;
        }

        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            NSLog(@"JSON error: %@", jsonError);
            completionBlock(nil, error);
            return;
        }

        if (json[@"artists"] != [NSNull null]) {
            NSArray *dictionary = json[@"artists"];
            MJPArtist *artist = [[MJPArtist alloc] initWithDictionary:dictionary[0]];
            completionBlock(artist, nil);
        }
    }];
    [task resume];
}

- (MJPArtist *)fetchSavedArtist:(MJPArtist *)artist {
    NSURL *directory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
    NSURL *url = [[directory URLByAppendingPathComponent:artist.strArtist] URLByAppendingPathExtension:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    MJPArtist *savedArtist = [[MJPArtist alloc] initWithDictionary:dictionary];
    return savedArtist;
}



@end
