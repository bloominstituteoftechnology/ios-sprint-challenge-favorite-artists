//
//  ArtistController.m
//  FavoriteArtists
//
//  Created by Matthew Martindale on 8/2/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

#import "ArtistController.h"
#import "Artist.h"

@interface ArtistController () {
    NSMutableArray *_internalArtists;
}
@end

@implementation ArtistController

- (NSArray<Artist *> *)artists
{
    return _internalArtists.copy;
}

- (void)addArtist:(Artist *)artist
{
    [_internalArtists addObject:artist];
}

@end
