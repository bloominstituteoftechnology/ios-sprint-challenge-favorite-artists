//
//  ArtistController.m
//  FavoriteArtists
//
//  Created by Jessie Ann Griffin on 5/31/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

#import "ArtistController.h"
#import "Artist.h"

@implementation ArtistController

- (void)saveArtistToFavorites:(Artist *)artist
{
    [self.artists addObject:artist];
}

- (void)saveTopersistentStore
{

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
