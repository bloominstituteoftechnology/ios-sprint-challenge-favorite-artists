//
//  HMRArtist.m
//  FavoriteArtist
//
//  Created by Harmony Radley on 7/17/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

#import "HMRArtist.h"

@implementation HMRArtist

- (instancetype)initWithArtist:(NSString *)artist
                    yearFormed:(int)yearFormed
                    biography :(NSString *)biography {

    if (self = [super init]) {

        _artist = [artist copy];
        _yearFormed = yearFormed;
        _biography = [biography copy];
    }
    return self;
}

@end
