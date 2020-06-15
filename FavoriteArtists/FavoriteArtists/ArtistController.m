//
//  ArtistController.m
//  FavoriteArtists
//
//  Created by Jessie Ann Griffin on 5/31/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

#import "ArtistController.h"
#import "Artist.h"
#import "Artist+NSJSONSerialization.h"

@interface ArtistController ()

@property (nonatomic) NSMutableArray *internalArtists;
- (NSURL *)fileURL;

@end

@implementation ArtistController

- (instancetype)init
{
    if (self = [super init]) {
        _internalArtists = [[NSMutableArray alloc] init];
    }
    return self;
}

- (Artist *)artistAtIndex:(NSInteger)index {
    return [_internalArtists objectAtIndex:index];
}

- (NSInteger)artistCount {
    return _internalArtists.count;
}

- (void)saveArtistToFavorites:(Artist *)artist
{
    [_internalArtists addObject:artist];
    [self saveToPersistentStore:artist];
    NSLog(@"%@", artist);
}

- (NSURL *)fileURL {
    NSURL *documentDirectory = [[[NSFileManager defaultManager]
                                 URLsForDirectory:NSDocumentDirectory
                                 inDomains:NSUserDomainMask] firstObject];
    NSString *fileName = @"artists.json";
    return [documentDirectory URLByAppendingPathComponent:fileName];
}

- (void)saveToPersistentStore:(Artist *)artist
{
    NSLog(@"File URL: %@", self.fileURL);
    NSMutableArray *arrayOfArtists = [[NSMutableArray alloc] init];

    for (Artist *artist in self.internalArtists) {
        NSDictionary *dictionaryFromArtist = [artist toDictionary];
        [arrayOfArtists addObject:dictionaryFromArtist];
    }
    NSDictionary *dictionary = @{@"artists" : arrayOfArtists};
    NSLog(@"%@", dictionary);
    [dictionary writeToURL:self.fileURL atomically:YES];
}

- (void)loadFromPersistentStore
{
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//
//    if ([fileManager fileExistsAtPath:self.fileURL.path]) {
//        NSLog(@"File Exists");

    NSArray *artistDictionaries = [[[NSDictionary alloc] initWithContentsOfURL:self.fileURL] objectForKey:@"artists"];

    
    for (NSDictionary *artistDictionary in artistDictionaries) {
        if (![artistDictionary isKindOfClass:[NSDictionary class]]) continue;

        Artist *artist = [[Artist alloc] initWithDictionary:artistDictionary];

        if (artist) {
            [self.internalArtists addObject:artist];
        } else {
            // TODO: One of our "required" fields might be optional and we may need to debug this with real data
            NSLog(@"Unable to parse artist dictionary: %@", artistDictionary);
        }
    }
//        NSDictionary *artistDictionary = [[NSDictionary alloc] initWithContentsOfURL:self.fileURL];
//        self.artists = [NSArray arrayWithObject:artistDictionary];
//        NSLog(@"%@", artistDictionary);
//    } else {
//        NSLog(@"File not found");
//    }
}

@end
