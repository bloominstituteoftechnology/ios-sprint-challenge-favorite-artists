//
//  HAOArtistFetcher.m
//  FavoriteArtists
//
//  Created by Hunter Oppel on 6/12/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

#import "HAOArtistFetcher.h"
#import "HAOArtist.h"
#import "HAOArtist+HAOArtist_NSJSONSerialization.h"
#import "LSIErrors.h"
#import "LSILog.h"


static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@implementation HAOArtistFetcher

- (void)fetchArtistWithName:(NSString *)name completion:(HAOArtistFetcherCompletion)completion
{
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:baseURLString];
    
    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"s" value:name]
    ];
    
    NSURL *url = urlComponents.URL;
    
    if (url) {
        NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error) {
                completion(nil, error);
                return;
            }
            
            if (data == nil) {
                NSError *dataError = errorWithMessage(@"Data is nil", LSIDataNilError);
                completion(nil, dataError);
                return;
            }
            
            NSError *jsonError = nil;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            
            if (jsonError) {
                completion(nil, jsonError);
                return;
            }
            
            HAOArtist *artist = [[HAOArtist alloc] initWithDictionary:json];
            completion(artist, nil);
        }];
        
        [task resume];
    } else {
        NSLog(@"⚠️ URL was nil, something went wrong: %@", url);
    }
}

@end
