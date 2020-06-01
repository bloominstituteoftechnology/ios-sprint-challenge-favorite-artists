//
//  FavoriteArtistsController.m
//  Favorite Artists
//
//  Created by David Wright on 6/1/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

#import "FavoriteArtistsController.h"
#import "Artist.h"

@interface FavoriteArtistsController () {
    NSMutableArray *_internalArtists;
}

@end

@implementation FavoriteArtistsController

- (instancetype)init
{
    if (self = [super init]) {
        _internalArtists = [[NSMutableArray alloc] init];
        
        // TODO: Load Artists from disk
        
    }
    return self;
}

#pragma mark - Convenience Accessors

- (NSArray<Artist *> *)artists
{
    return _internalArtists.copy;
}

- (void)addArtist:(Artist *)artist
{
    [_internalArtists addObject:artist];
}

@end
