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
        completion(artistResults.artists, nil);
        NSLog(@"Count: %lu", (unsigned long)artistResults.artists.count);
    }];
    [task resume];
}

@end
