//
//  Artist.m
//  FavoriteArtists
//
//  Created by Jessie Ann Griffin on 5/29/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

#import "Artist.h"

@implementation Artist

- (instancetype)initWithName:(NSString *)artistName
                   biography:(NSString *)artistBiography
                  yearFormed:(int)yearFormed
{
    if (self = [super init]) {
        _artistName = artistName.copy;
        _artistBiography = artistBiography.copy;
        _yearFormed = yearFormed;
    }
    return self;
}

@end
