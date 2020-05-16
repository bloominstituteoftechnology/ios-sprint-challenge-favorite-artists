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

@interface OTKArtistController ()

@property (nonatomic) NSMutableArray *privateArtists;

@end

@implementation OTKArtistController

- (instancetype)init {
    self = [super init];
    if (self) {
        _privateArtists = [[NSMutableArray alloc] init];
        [self fetchArtists];
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

- (NSArray<OTKArtist *> *)artists {
    return [_privateArtists copy];
}

- (void)saveArtist:(OTKArtist *)artist {
    [self.privateArtists addObject:artist];

    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentDir = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSURL *artistsURL = [documentDir URLByAppendingPathComponent:@"artistsURL.json"];
    NSMutableArray *favorites = [[NSMutableArray alloc] init];

    for(OTKArtist *artist in self.privateArtists) {
        [favorites addObject:[artist toDictionary]];
    }

    NSError *errorWithJSON = nil;
    NSData* json = [NSJSONSerialization dataWithJSONObject:favorites options:0 error:&errorWithJSON];

    if (errorWithJSON) {
        NSLog(@"Error saving artist: %@", errorWithJSON);
        return;
    }

    [json writeToURL:artistsURL atomically:YES];
}

- (void)fetchArtists {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentDir = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSURL *artistsURL = [documentDir URLByAppendingPathComponent:@"artistsURL.json"];
    NSData *favoriteArtists = [NSData dataWithContentsOfURL:artistsURL];

    NSError *errorWithJSON = nil;
    NSArray *favorites = [NSJSONSerialization JSONObjectWithData:favoriteArtists options:0 error:&errorWithJSON];

    if (errorWithJSON) {
        NSLog(@"Error fetching artist: %@", errorWithJSON);
        return;
    }

    for (NSDictionary *dictionary in favorites) {
        OTKArtist *artist = [[OTKArtist alloc] initWithDictionary:dictionary];
        [self.privateArtists addObject:artist];
    }
}

@end
