//
//  FetchArtist.m
//  FavoriteArtists
//
//  Created by Matthew Martindale on 8/2/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

#import "FetchArtist.h"
#import "Artist.h"
#import "ArtistResults.h"

static NSString *const ArtistFetchBaseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php?";

@implementation FetchArtist

- (void)fetchArtistWithSearchedName:(NSString *)searchedArtistName
                  completionHandler:(ArtistFetchCompletionHandler)completionHandler
{
    if (!completionHandler) return;
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:ArtistFetchBaseURLString];
    
    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"s" value:searchedArtistName]
    ];
    
    NSURL *url = urlComponents.URL;
    
    NSLog(@"Fetching artist by name: %@, url: %@", searchedArtistName, url.absoluteString);
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error fetching artist: %@", error);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, error);
            });
            return;
        }
        
        NSError *jsonError;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (!dictionary) {
            NSLog(@"Error decoding json: %@", jsonError);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, jsonError);
            });
            return;
        }
        
        ArtistResults *artistResults = [[ArtistResults alloc] initWithDictionary:dictionary];
        if (!artistResults) {
            
            NSLog(@"Error decoding results dictionary: %@", error);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, jsonError);
            });
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(artistResults.artists, nil);
        });
        
    }]resume];
}

@end
