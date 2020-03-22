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

- (NSString *)artistFilePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *path = paths[0];
    path = [path stringByAppendingPathComponent:@"artists"];
    path = [path stringByAppendingPathExtension:@"json"];

    return path;
}

- (void)saveToPersistentStore {
    NSString *artistKey = @"artist";
    NSString *artistPath = [self artistFilePath];
    NSMutableArray *artists = [[NSMutableArray alloc] init];
    
    for (MBMArtist *artist in self.artistsArray) {
        NSDictionary *artistDictionary = [artist toDictionary];
        [artists addObject:artistDictionary];
    }
    
    NSDictionary *dict = @{artistKey : artists};
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
    NSURL *urlPath = [NSURL fileURLWithPath:artistPath];
    [data writeToURL:urlPath atomically:YES];
    
}

- (void)loadFromPersistentStore {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *artistKey = @"artist";
    NSString *artistPath = [self artistFilePath];
    
    if ([fileManager fileExistsAtPath:artistPath]) {
        NSURL *urlPath = [NSURL fileURLWithPath:artistPath];
        NSData *data = [NSData dataWithContentsOfURL:urlPath];
        NSError *error = nil;
        NSMutableDictionary *artistDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSArray *artistArray = artistDictionary[artistKey];
        for (NSMutableDictionary *dict in artistArray) {
            MBMArtist *artist = [[MBMArtist alloc ] initWithDictionary:dict];
            [self.artistsArray addObject:artist];
        }
    }
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
        NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            NSLog(@"Error decoding JSON from data: %@", jsonError);
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, jsonError);
            });
            return;
        }
        NSLog(@"JSON: %@", json);
        
        MBMArtistResults *artistResults = [[MBMArtistResults alloc] initWithDictionary:json];
        
        completion(artistResults.artists, nil);
    }];
    [task resume];

}

@end
