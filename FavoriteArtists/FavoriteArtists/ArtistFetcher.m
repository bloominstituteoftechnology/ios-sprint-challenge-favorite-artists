//
//  ArtistFetcher.m
//  FavoriteArtists
//
//  Created by Clayton Watkins on 9/25/20.
//

#import "ArtistFetcher.h"
#import "Artist.h"
#import "ArtistResults.h"

static NSString *const ArtistFetcherBaseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php?";

@implementation ArtistFetcher

- (void)fetchArtistWithName:(NSString *)artistName completionHandler:(ArtistFetcherCompletionHandler)completionHandler
{
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString: ArtistFetcherBaseURLString];
    
    urlComponents.queryItems = @[ [NSURLQueryItem queryItemWithName:@"s" value:artistName] ];
    
    NSURL *url = urlComponents.URL;
    NSLog(@"Fetching Aritists: %@", url);
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching artist: %@", error);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, error);
            });
        }
        
        NSError *jsonError;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:0
                                                                     error:&jsonError];
        if (!dictionary) {
            NSLog(@"Error decoding JSON: %@", jsonError);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, error);
            });
            return;
        }
        
        ArtistResults *results = [[ArtistResults alloc]initWithDictionary:dictionary];
        if (!results) {
            NSError *error = [NSError errorWithDomain:@"ArtistFetcherDomain" code:-1 userInfo:nil];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, error);
            });
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(results.artists, nil);
        });
        
    }] resume];
}

@end
