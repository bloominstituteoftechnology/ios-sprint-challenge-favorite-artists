//
//  JSKFetchArtistController.m
//  FavoriteArtists
//
//  Created by Josh Kocsis on 9/25/20.
//

#import "JSKFetchArtistController.h"
#import "JSKArtist.h"
#import "JSKArtist+NSJSONSerialization.h"
#import "JSKArtistController.h"
#import "JSKArtistResults.h"

static NSString *const ArtistFetcherBaseURLString = @"https://theaudiodb.com/api/v1/json/1/search.php?";

@implementation JSKFetchArtistController

- (void)fetchArtistWithName:(NSString *)artistName fetchArtistWithCompletionHandler:(ArtistFetcherCompletionHandler)completionHandler
{

    if (!completionHandler) return;

    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:ArtistFetcherBaseURLString];

    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"s" value:artistName]
    ];

    NSURL *url = urlComponents.URL;
    NSLog(@"Fetching Artist: %@", url);

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

        if (!dictionary || ![dictionary isKindOfClass:NSDictionary.class]) {
            NSLog(@"Error decoding JSON: %@", jsonError);

            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, jsonError);
            });
            return;
        }

        JSKArtistResults *results = [[JSKArtistResults alloc] initWithDictionary:dictionary];
        if (!results) {
            NSError *apiError;
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
