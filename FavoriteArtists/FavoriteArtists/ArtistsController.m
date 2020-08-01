//
//  ArtistsController.m
//  FavoriteArtists
//
//  Created by Claudia Maciel on 7/31/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

#import "ArtistsController.h"
#import "Artist.h"

@interface ArtistsController ()
{
    NSMutableArray *_artistsInternal;
}

@end

@implementation ArtistsController

- (instancetype) init
{
    self = [super init];
    
    if (self)
    {
        _artistsInternal = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSArray<Artist *>*)artists
{
    return _artistsInternal.copy;
}

- (void)addArtist:(Artist *)artist
{
    [_artistsInternal addObject:artist];
}
@end
