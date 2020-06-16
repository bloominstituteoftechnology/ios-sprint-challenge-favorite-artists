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
        _artists = _internalArtists;
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
    [self saveToPersistentStore];
    NSLog(@"%@", artist);
}

- (NSURL *)fileURL {
    NSURL *documentDirectory = [[[NSFileManager defaultManager]
                                 URLsForDirectory:NSDocumentDirectory
                                 inDomains:NSUserDomainMask] firstObject];
    NSString *fileName = @"artists.json";
    return [documentDirectory URLByAppendingPathComponent:fileName];
}

- (void)saveToPersistentStore
{
    NSMutableArray *arrayOfArtists = [[NSMutableArray alloc] init];
    for (Artist *artist in self.internalArtists) {
        NSDictionary *dictionaryFromArtist = [artist toDictionary];
        [arrayOfArtists addObject:dictionaryFromArtist];
    }

    NSDictionary *dictionary = @{@"artists" : arrayOfArtists};
    [dictionary writeToURL:self.fileURL atomically:YES];
}

- (void)loadFromPersistentStore
{
    NSFileManager *fileManager = [NSFileManager defaultManager];

    if (![fileManager fileExistsAtPath:self.fileURL.path]) {
        NSLog(@"File Exists");
        return;
    }

    NSArray *artistDictionaries = [[[NSDictionary alloc] initWithContentsOfURL:self.fileURL] objectForKey:@"artists"];
    NSMutableArray *artistArray = [[NSMutableArray alloc] init];

    for (NSDictionary *artistDictionary in artistDictionaries) {
        if (![artistDictionary isKindOfClass:[NSDictionary class]]) continue;

        Artist *artist = [[Artist alloc] initWithDictionary:artistDictionary];

        if (artist) {
            [artistArray addObject:artist];
        } else {
            NSLog(@"Unable to parse artist dictionary: %@", artistDictionary);
        }
    }
    self.internalArtists = artistArray;
}

@end
