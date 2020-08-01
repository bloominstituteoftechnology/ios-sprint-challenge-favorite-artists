//
//  KSIArtistController.m
//  FavoriteArtists-ObjC
//
//  Created by Kevin Stewart on 7/31/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

#import "KSIArtistController.h"
#import "KSIArtist.h"
#import "KSIArtistResults.h"
#import "LSIErrors.h"

static NSString *const ArtistFetcherBaseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@implementation KSIArtistController

- (void)searchForArtists:(NSString *)name
              completion:(ArtistFetcherCompletionHandler)completionHandler
{
    if (!completionHandler) return;
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:ArtistFetcherBaseURLString];
    
    NSURLQueryItem *searchTerm = [NSURLQueryItem queryItemWithName:@""
                                                             value:name];
    [urlComponents setQueryItems:@[searchTerm]];
    NSURL *url = urlComponents.URL;
    NSLog(@"Fetching artists from: %@", url);
    
    [[NSURLSession.sharedSession dataTaskWithURL:url
                               completionHandler:^(NSData * data,
                                                   NSURLResponse * response,
                                                   NSError * error) {
        if (error) {
            NSLog(@"Error fetching artists: %@", error);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, error);
            });
            
            return;
        }
        
        NSError *jsonError;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:0
                                                                     error:&jsonError];
        if (!dictionary) {
            NSLog(@"Error decoding JSON: %@", jsonError);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, jsonError);
            });
            
            return;
        }
        
        KSIArtistResults *results = [[KSIArtistResults alloc] initWithDictionary:dictionary];
        if (!results) {
            NSError *apiError = errorWithMessage(@"Invalid JSON dictionary", LSIAPIError);
            NSLog(@"Error decoding results dictionary: %@", apiError);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, apiError);
            });
            
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(results.artists, nil);
        });
    }] resume];

}

@end
