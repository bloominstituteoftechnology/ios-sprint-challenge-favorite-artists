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
            completionBlock:(void (^)(HLOArtist * _Nullable artist, NSError * _Nullable error))completionBlock {

    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];

    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"s" value:artistName]
    ];

    NSURL *url = urlComponents.URL;

    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@", urlComponents.URL);
        if (error) {
            completionBlock(nil, error);
            return;
        }

        [self parseJSONData:data completionBlock:^(HLOArtist * _Nullable artist, NSError * _Nullable error) {
            if (error) {
                completionBlock(nil, error);
                return;
            }
            completionBlock(artist, nil);
        }];

    }];

    [task resume];


}

- (void)parseJSONData:(NSData *)data
      completionBlock:(void (^)(HLOArtist * _Nullable artist, NSError * _Nullable error))completionBlock {

    NSError *jsonError = nil;

    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

    if (jsonError) {
        completionBlock(nil, jsonError);
        return;
    }

    // FIXME: Create custom errors.
    if (json[@"artists"] == nil) {
        completionBlock(nil, [[NSError alloc] init]);
        return;
    }

    HLOArtist *newArtist = [[HLOArtist alloc] initFromDictionary:json];
    completionBlock(newArtist, nil);

    return;
}

- (void)loadArtistsFromPersistence:(void (^)(NSError * _Nullable error))completionBlock {
    NSURL *documentsDirectory = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;

    NSError *loadDataError = nil;
    NSArray *data = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsDirectory.path error:&loadDataError];
    if (loadDataError) {
        completionBlock(loadDataError);
        return;
    }

    for (NSString *path in data) {
        NSURL *filePath = [documentsDirectory URLByAppendingPathComponent:path];
        NSData *jsonData = [NSData dataWithContentsOfURL:filePath];
        [self parseJSONData:jsonData completionBlock:^(HLOArtist * _Nullable artist, NSError * _Nullable error) {
            if (error) {
                NSLog(@"Error loading file at: %@", filePath);
                return;
            }
            [self.favoriteArtists addObject:artist];
        }];
    }

    completionBlock(nil);
}

@end
