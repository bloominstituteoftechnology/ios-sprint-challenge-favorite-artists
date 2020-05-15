//
//  HLOArtistModelController.m
//  FavoriteArtists
//
//  Created by Karen Rodriguez on 5/15/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

#import "HLOArtistModelController.h"
#import "HLOArtist.h"
#import "HLOArtist+NSJSONSerialization.h"

static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@implementation HLOArtistModelController

- (instancetype)init {
    self = [super init];
    if (self) {
        // Initialize empty array in default initializer so that tableview may have data to use for protocol stubs.
        _favoriteArtists = [[NSMutableArray<HLOArtist *> alloc] init];
    }
    return self;
}

- (void)fetchArtistWithName:(NSString *)artistName
            completionBlock:(void (^)(NSError * _Nullable error))completionBlock {

    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];

    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"s" value:artistName]
    ];

    NSURL *url = urlComponents.URL;

    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@", urlComponents.URL);
        if (error) {
            completionBlock(error);
            return;
        }

        [self parseJSONData:data completionBlock:^(NSError * _Nullable error) {
            if (error) {
                completionBlock(error);
                return;
            }
            completionBlock(nil);
        }];

    }];

    [task resume];


}

- (void)parseJSONData:(NSData *)data
      completionBlock:(void (^)(NSError * _Nullable error))completionBlock {

    NSError *jsonError = nil;

    if (jsonError) {
        completionBlock(jsonError);
        return;
    }

    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

#warning caller won't know if the search was invalid.
    // FIXME: Create custom errors.
    if (json[@"artists"] == nil) {
        completionBlock(nil);
        return;
    }

    HLOArtist *newArtist = [[HLOArtist alloc] initFromDictionary:json];

    [self.favoriteArtists addObject:newArtist];
    completionBlock(nil);

    return;
}

@end
