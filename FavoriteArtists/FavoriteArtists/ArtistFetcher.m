//
//  ArtistFetcher.m
//  FavoriteArtists
//
//  Created by Sean Acres on 8/2/20.
//  Copyright © 2020 Sean Acres. All rights reserved.
//

#import "ArtistFetcher.h"
#import "SMAFavoriteArtist.h"
#import "SMAArtistResults.h"

static NSString *const ArtistFetcherBaseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php?s=";

@implementation ArtistFetcher

- (void)fetchArtistsWithCompletionHandler:(ArtistFetcherCompletionHandler)completionHandler
{
    [self fetchArtistsWithArtistName:@"" completionHandler:completionHandler];
}

- (void)fetchArtistsWithArtistName:(NSString *)artistName
                 completionHandler:(ArtistFetcherCompletionHandler)completionHandler
{
    if (!completionHandler) return;
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:ArtistFetcherBaseURLString];
    
    NSURL *url = [urlComponents.URL URLByAppendingPathComponent:artistName];
    
    NSLog(@"Fetching artist at url: %@", url);
    
    [[NSURLSession.sharedSession dataTaskWithURL:url
                               completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error fetching artists: %@", error);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, error);
            });
            
            return;
        }
        
        NSError *jsonError;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (!dictionary) {
            NSLog(@"Error decoding JSON: %@", jsonError);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, jsonError);
            });
            
            return;
        }
        
        SMAArtistResults *results = [[SMAArtistResults alloc] initWithDictionary:dictionary];
        
        if (!results) {
            NSError *apiError;
            NSLog(@"Error getting results: %@", apiError);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, apiError);
            });
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(results.artists, nil);
        });
        
    }] resume];
}

@end
