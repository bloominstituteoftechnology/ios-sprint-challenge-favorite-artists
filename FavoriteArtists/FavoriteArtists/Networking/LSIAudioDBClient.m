//
//  LSINetworkingClient.m
//  FavoriteArtists
//
//  Created by Shawn Gee on 5/15/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

#import "LSIAudioDBClient.h"
#import "LSIErrors.h"
#import "LSIArtistResults.h"
#import "LSIArtist.h"

static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@implementation LSIAudioDBClient

- (void)fetchArtistsForQuery:(NSString *)query
                  completion:(LSIArtistQueryCompletion)completion {
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:baseURLString];
    urlComponents.queryItems = @[[NSURLQueryItem queryItemWithName:@"s" value:query]];
    NSURL *url = urlComponents.URL;
    
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            completion(nil, error);
            return;
        }

        if (!data) {
            NSError *dataError = errorWithMessage(@"No artist data returned", LSIDataNilError);
            completion(nil, dataError);
            return;
        }

        NSError *jsonError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

        if (jsonError) { // jsonError != nil
            completion(nil, jsonError);
            return;
        }
        
        LSIArtistResults *artistResults = [[LSIArtistResults alloc] initWithDictionary:dictionary];
        completion(artistResults.artists, nil);
    }];
    
    [task resume];
}

@end
