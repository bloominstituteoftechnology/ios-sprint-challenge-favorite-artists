//
//  HLOArtistModelController.m
//  FavoriteArtists
//
//  Created by Karen Rodriguez on 5/15/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

#import "HLOArtistModelController.h"
#import "HLOArtist.h"

static NSString *baseURLString = @"theaudiodb.com/api/v1/json/1/search.php?s=";

@implementation HLOArtistModelController

- (instancetype)init {
    self = [super init];
    if (self) {
        // Initialize empty array in default initializer so that tableview may have data to use for protocol stubs.
        _favoriteArtists = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)fetchArtistWithName:(NSString *)artistName
            completionBlock:(void (^)(NSError * _Nullable error))completionBlock {

    NSURL *baseURL = [[NSURL alloc] initWithString:baseURLString];
    NSURL *requestURL = [baseURL URLByAppendingPathComponent:artistName];

    NSLog(@"%@", requestURL.absoluteString);

}

- (void)parseJSONData:(NSData *)data
      completionBlock:(void (^)(NSError * _Nullable error))completionBlock {

}

@end
