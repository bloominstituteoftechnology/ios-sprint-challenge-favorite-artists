//
//  ArtistController.m
//  FavoriteArtists
//
//  Created by Jessie Ann Griffin on 5/31/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

#import "ArtistController.h"
#import "Artist.h"

@interface ArtistController ()

@property (nonatomic) NSMutableArray *internalArtists;

@end

@implementation ArtistController

- (instancetype)init
{
    if (self = [super init]) {
        _internalArtists = [[NSMutableArray alloc] init];
//
//        Artist *artist = [[Artist alloc] initWithName:@"" biography:@"" yearFormed:1970];
//        [_internalArtists addObject:artist];
    }
    return self;
}

- (NSArray *)artistsAtIndex:(NSIndexSet *)indexes{
    return _internalArtists.copy;
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
}

- (void)saveToPersistentStore
{
    [_internalArtists.copy writeToURL:self.artistListURL error:nil];
}

- (void)loadFromPersistentStore
{
    NSFileManager *fileManager = [[NSFileManager alloc] init];

    if ([fileManager fileExistsAtPath:self.artistListURL.path]) {
        // anytime you need to call init you need alloc
        NSDictionary *artistDictionary = [[NSDictionary alloc] initWithContentsOfURL:self.artistListURL];
    }
}

@end
