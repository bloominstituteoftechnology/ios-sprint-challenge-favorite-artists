//
//  LSIArtistController.m
//  Favorite_Artistis
//
//  Created by Joe on 8/2/20.
//  Copyright © 2020 AlphaGradeINC. All rights reserved.
//

#import "LSIArtistController.h"

@interface LSIArtistController () {
    NSMutableArray *_internalArtists;
}
@end

@implementation LSIArtistController

- (instancetype)init
{
    if (self = [super init]) {
        _internalArtists = [[NSMutableArray alloc] init];
        [self addArtist];
    }
    return self;
}

- (NSUInteger)artistCount
{
    return [_internalArtists count];  // Access the amount of tips that exist.
}

- (void)addArtist:(LSIArtist *)anArtist
{
    [_internalArtists addObject:anArtist];
}


@end
