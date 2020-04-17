//
//  SAHArtistFetcher.m
//  Favorite Artists
//
//  Created by scott harris on 4/17/20.
//  Copyright © 2020 scott harris. All rights reserved.
//

#import "SAHArtistFetcher.h"
#import "SAHArtist+NSJSONSerialization.h"

static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@implementation SAHArtistFetcher

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (void)fetchArtistWithName:(NSString *)name completionBlock:(SAHArtistFetcherCompletionBlock)completionBlock {
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];
    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"s" value:name]
    ];
    
    NSURL *url = urlComponents.URL;
    
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"URL: %@", url);
        
        // Errors
        if (error) {
            completionBlock(nil, error);
            return;
        }
        
        if (!data) {
            NSError *dataError = [[NSError alloc] initWithDomain:@"com.sah.Artists" code:100 userInfo:nil];
            completionBlock(nil, dataError);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            completionBlock(nil, jsonError);
            return;
        }
        
        SAHArtist *artist = [[SAHArtist alloc] initWithDictionary:jsonDictionary];
        completionBlock(artist, nil);
        
    }];
    
    [task resume];
    
}

@end
