//
//  CAMArtistController.m
//  FavoriteArtists
//
//  Created by Cody Morley on 7/17/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

#import "CAMArtistController.h"
#import "CAMArtist.h"
#import "CAMArtist+Serialization.h"

@interface CAMArtistController () {}

@property (nonatomic) NSMutableArray *favoriteArtistsSafeStore;

@end

@implementation CAMArtistController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _favoriteArtistsSafeStore = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)savedArtists {
    return [self.favoriteArtistsSafeStore copy];
}


@end
