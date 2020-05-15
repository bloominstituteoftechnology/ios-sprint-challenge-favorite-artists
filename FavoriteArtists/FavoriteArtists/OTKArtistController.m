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
    [self saveFavoriteArtists];
}

- (NSURL *)persistentFileURL {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentDir = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSURL *artistsURL = [documentDir URLByAppendingPathComponent:@"artistsURL"];

    return artistsURL;
}

- (void)saveFavoriteArtists {

    NSMutableArray *favorites = [[NSMutableArray alloc] init];

    for (int i = 0; i < self.artists.count; i++) {
        OTKArtist *artist = self.artists[i];
        [favorites addObject:[artist toDictionary]];
    }

    NSData *data = [NSJSONSerialization dataWithJSONObject:favorites options:0 error:nil];
    [data writeToURL:[self persistentFileURL] atomically:YES];
}

- (NSArray *)fetchFavoriteArtists {
    NSData *data = [[NSData alloc] initWithContentsOfURL:[self persistentFileURL]];

    NSError *errorWithJSON;
    NSArray *artistsArrayData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&errorWithJSON];
    NSMutableArray *artists = [[NSMutableArray alloc] init];

    if (errorWithJSON) {
        NSLog(@"Error fetching artists: %@", errorWithJSON);
        return @[];
    }

    for (int i = 0; i < artistsArrayData.count; i++) {
        NSDictionary *dictionary = artistsArrayData[i];
        OTKArtist *artist = [[OTKArtist alloc] initWithDictionary:dictionary];
        [artists addObject:artist];
    }

    return artists;
}

@end
