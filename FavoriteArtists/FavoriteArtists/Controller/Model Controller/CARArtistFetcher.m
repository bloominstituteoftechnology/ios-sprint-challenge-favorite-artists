//
//  CARArtistFetcher.m
//  FavoriteArtists
//
//  Created by Chad Rutherford on 2/21/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import "CARArtistFetcher.h"
#import "LSIErrors.h"

@implementation CARArtistFetcher

static NSString *const baseURLString = @"https://www.theaudiodb.com/api/v1/json";
static NSString *const apiKey = @"1";
static NSString *const searchComponent = @"search.php";

- (void)fetchArtistForSearchString:(NSString *)searchString completion:(CARArtistFetcherCompletion)completion {
    NSURL *baseURL = [[[[NSURL alloc] initWithString:baseURLString] URLByAppendingPathComponent:apiKey] URLByAppendingPathComponent:searchComponent];
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithURL:baseURL resolvingAgainstBaseURL:YES];
    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"s" value:searchString]
    ];
    NSURL *url = urlComponents.URL;
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, error);
            });
            return;
        }
        
        if (!data) {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSError *dataError = errorWithMessage(@"Data should not be nil from API request.", LSIDataNilError);
                completion(nil, dataError);
            });
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, jsonError);
            });
            return;
        }
        
        NSArray *artistData = json[@"artists"];
        NSDictionary *artistDictionary = artistData[0];
        CARFavoriteArtist *artist = [[CARFavoriteArtist alloc] initWithDictionary:artistDictionary];
        if (!artist) {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSError *parsingError = errorWithMessage(@"Unable to parse the JSON object: %@", LSIJSONDecodeError);
                completion(nil, parsingError);
            });
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(artist, nil);
        });
    }] resume];
}

@end
