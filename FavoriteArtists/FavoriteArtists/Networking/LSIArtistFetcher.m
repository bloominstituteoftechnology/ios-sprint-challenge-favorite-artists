//
//  ArtistFetcher.m
//  FavoriteArtists
//
//  Created by Elizabeth Thomas on 9/27/20.
//

#import "LSIArtistFetcher.h"
#import "LSIArtist.h"
#import "LSIArtistResults.h"

static NSString *const ArtistFetcherBaseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php?";

@implementation LSIArtistFetcher

- (void)fetchArtistsWithName:(NSString *)name completionHandler:(ArtistFetcherCompletionHandler)completionHandler
{
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:ArtistFetcherBaseURLString];

    urlComponents.queryItems = @[[NSURLQueryItem queryItemWithName:@"s" value:name]];

    NSURL *url = urlComponents.URL;
    NSLog(@"Fetching artists: %@", url);

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

            LSIArtistResults *results = [[LSIArtistResults alloc] initWithDictionary:dictionary];
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
