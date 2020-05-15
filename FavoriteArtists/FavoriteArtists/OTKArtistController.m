//
//  OTKArtistController.m
//  FavoriteArtists
//
//  Created by Tobi Kuyoro on 15/05/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

#import "OTKArtistController.h"
#import "OTKArtist+NSJSONSerialization.h"
#import "OTKArtist.h"

static NSString *baseURLString = @"https://theaudiodb.com/api/v1/json/1/search.php";

@implementation OTKArtistController

- (instancetype)initWithArray:(NSMutableArray *)artists {
    self = [super init];
    if (self) {
        _artists = artists;
    }

    return self;
}

- (void)findArtist:(NSString *)artistName completion:(ArtistFetchCompletion)completion {
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];
    NSURLQueryItem *artist = [NSURLQueryItem queryItemWithName:@"s" value:artistName];
    urlComponents.queryItems = @[artist];

    NSURL *url = urlComponents.URL;

    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completion(nil, error);
            return;
        }

        if (!data) {
            completion(nil, [[NSError alloc] init]);
            return;
        }

        NSError *errorWithJSON = nil;

        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&errorWithJSON];
        if (errorWithJSON) {
            completion(nil, error);
            return;
        }

        NSDictionary *artistJSON = [json[@"artists"] firstObject];
        OTKArtist *artist = [[OTKArtist alloc] initWithDictionary:artistJSON];
        completion(artist, nil);
    }];

    [task resume];
}

- (void)saveArtist:(OTKArtist *)artist {
    [self.artists addObject:artist];
}

@end
