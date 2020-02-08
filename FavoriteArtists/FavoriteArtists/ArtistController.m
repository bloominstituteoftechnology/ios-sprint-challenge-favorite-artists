//
//  ArtistController.m
//  FavoriteArtists
//
//  Created by Joel Groomer on 2/8/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

#import "ArtistController.h"

@implementation ArtistController

- (void)addArtist:(Artist *)anArtist
{
    if (![self.artists containsObject:anArtist]) {
        [self.artists addObject:anArtist];
    }
}

- (void)delArtist:(Artist *)anArtist
{
    [self.artists removeObject:anArtist];
}

#pragma mark - Accessors

- (NSArray *)artists {
    return _artists.copy;
}

#pragma mark - Initializers

- (instancetype)init {
    if (self = [super init]) {
        _artists = [[NSMutableArray alloc] init];
    }
    
    return self;
}


@end
