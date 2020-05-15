//
//  MTGArtistFetcher.m
//  Favorite Artists
//
//  Created by Mark Gerrior on 5/15/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTGArtistFetcher.h"
#import "LSIErrors.h"
#import "MTGArtist.h"
#import "MTGArtist+NSJSONSerialization.h"

static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@implementation MTGArtistFetcher

- (void)fetchArtistByName:(NSString *)searchName
          completionBlock:(MTGArtistFetcherCompletion)completionBlock {

    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:baseURLString];

    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"s" value:searchName],
    ];

    NSURL *url = urlComponents.URL;
    // guard let
//    if (!url) {
//        return;
//    }
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"url: %@", url);

        if (error) {
            completionBlock(nil, error);
            return;
        }

        if (!data) {
            NSError *dataError = errorWithMessage(@"No earthquake data returned", LSIDataNilError);
            completionBlock(nil, dataError);
            return;
        }

        NSError *jsonError = nil; // no error has happened ... if it's not nil after call, there is an error
        // & = address of error
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

        if (jsonError) { // jsonError != nil
            completionBlock(nil, jsonError);
            return;
        }

//        MTGArtist *artist = [[MTGArtist alloc] initWithDictionary:dictionary];
        MTGArtist *artist = [[MTGArtist alloc] init];
        completionBlock(artist, nil);
    }];

    [task resume];
}

@end
