//
//  ArtistController.m
//  Favorite Artists
//
//  Created by Mark Gerrior on 5/15/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

#import "ArtistController.h"

@implementation ArtistController

- (void)add:(MTGArtist *)artist {
    self.artists = [self.artists arrayByAddingObject:artist];
}

@end
