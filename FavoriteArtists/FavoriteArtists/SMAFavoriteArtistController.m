//
//  SMAFavoriteArtistController.m
//  FavoriteArtists
//
//  Created by Sean Acres on 8/5/20.
//  Copyright © 2020 Sean Acres. All rights reserved.
//

#import "SMAFavoriteArtistController.h"

@interface SMAFavoriteArtistController ()

@property NSMutableArray *internalFavoriteArtists;

@end

@implementation SMAFavoriteArtistController

- (void)addArtist:(SMAFavoriteArtist *)artist
{
    [_internalFavoriteArtists addObject:artist];
}

- (NSArray<SMAFavoriteArtist *> *)artists
{
    return _internalFavoriteArtists.copy;
}

@end
