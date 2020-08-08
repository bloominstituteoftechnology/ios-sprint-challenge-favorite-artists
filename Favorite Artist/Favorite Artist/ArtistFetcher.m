//
//  ArtistFetcher.m
//  Favorite Artist
//
//  Created by Gerardo Hernandez on 8/8/20.
//  Copyright © 2020 Gerardo Hernandez. All rights reserved.
//

#import "ArtistFetcher.h"
#import "Artist.h"
#import "ArtistFetchResults.h"

static NSString *const ArtistFetcherBaseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php?";


@implementation ArtistFetcher

- (void)fetchArtistsWithName:(NSString *)name completionHandler:(ArtistFetcherCompletionHandler)completionHandler
{
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:ArtistFetcherBaseURLString];
    
    urlComponents.queryItems= @[ [NSURLQueryItem queryItemWithName:@"s" value:name] ];
     
     NSURL *url = urlComponents.URL;
     NSLog(@"Fetching Artist: %@", url);
     
      [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
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
             
             ArtistFetchResults *results = [[ArtistFetchResults alloc] initWithDictionary:dictionary];
             if (!results) {
                 NSError *error = [NSError errorWithDomain:@"ArtistFetcherDomain" code:-1 userInfo:nil];
                 
                 dispatch_async(dispatch_get_main_queue(), ^{
                     completionHandler(nil, error);
                 });
                 
                 return;
             }
             
             dispatch_async(dispatch_get_main_queue(), ^{
                 completionHandler(results.artist, nil);
             });
             
         }] resume];
     }

@end
