//
//  ArtistFetcher.m
//  FavoriteArtists
//
//  Created by Michael on 3/20/20.
//  Copyright © 2020 Michael. All rights reserved.
//

#import "ArtistFetcher.h"
#import "MBMArtist.h"
#import "MBMArtist+NSJSONSerialization.h"
#import "MBMArtistResults.h"

static NSString *baseURLString = @"https://theaudiodb.com/api/v1/json/1/search.php?";

@implementation ArtistFetcher

- (NSURL *)artistFilePath {
//    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *directoryPaths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSURL *documentsDirectoryPath = [directoryPaths objectAtIndex:0];
    NSURL *filePath = [documentsDirectoryPath URLByAppendingPathComponent:@"artists.plist"];
    NSLog(@"Path: %@", filePath);
    return filePath;
}

- (void)saveToPersistentStore {
    
//    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *artistPath = [self artistFilePath];
    
    NSError *error = nil;
    
    
    if (self.artistsArray.count > 0) {
        [self.artistsArray writeToURL:artistPath error:&error];
    }
    
    
    

    
}

- (void)loadFromPersistentStore {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *artistPath = [self artistFilePath];
    
    NSData *data = [[NSData alloc] initWithContentsOfFile:artistPath];
    
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    MBMArtistResults *artistResults = [[MBMArtistResults alloc] initWithDictionary:json];
    self.artistsArray = artistResults.artists;
    
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
        _artistsArray = [[NSMutableArray alloc] init];
        
    }
    return self;
}

- (void)searchArtistsWithArtistName:(NSString *)artistName completionBlock:(MBMArtistFetcherCompletion)completion {
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];
    
    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"s" value:artistName]
    ];
    
    NSURL *url = urlComponents.URL;
    NSLog(@"url: %@", url);
    
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching artists: %@", error);
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, error);
            });
            return;
        }
        if (!data) {
            NSLog(@"Bad or No data returned from data task.");
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, error);
            });
            return;
        }
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            NSLog(@"Error decoding JSON from data: %@", jsonError);
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, jsonError);
            });
            return;
        }
        NSLog(@"JSON: %@", json);
        
        MBMArtistResults *artistResults = [[MBMArtistResults alloc] initWithDictionary:json];
        
        // MARK: - Ask Paul why this commented out code makes the app crash...
        
//        [self.artistsArray addObject:artistResults.artists];
        completion(artistResults.artists, nil);
//        NSLog(@"Count: %lu", (unsigned long)artistResults.artists.count);
    }];
    [task resume];
}

@end
