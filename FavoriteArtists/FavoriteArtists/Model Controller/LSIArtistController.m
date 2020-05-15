//
//  LSIArtistController.m
//  FavoriteArtists
//
//  Created by Shawn Gee on 5/15/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

#import "LSIArtistController.h"
#import "LSIArtist.h"

@interface LSIArtistController ()

@property (nonatomic, readwrite, copy) NSArray *artists;

@end

@implementation LSIArtistController

- (instancetype)init {
    self = [super init];
    if (!self) { return nil; }
    
    _artists = [[NSArray alloc] init];
    
    return self;
}

- (void)addArtist:(LSIArtist *)artist {
    self.artists = [self.artists arrayByAddingObject:artist];
}

@end
