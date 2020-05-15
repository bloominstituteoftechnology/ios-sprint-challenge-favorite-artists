//
//  Artist.m
//  FavoriteArtists
//
//  Created by Karen Rodriguez on 5/15/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

#import "HLOArtist.h"

@implementation HLOArtist

- (instancetype)initWithName:(NSString *)artistName
artistBiography:(NSString *)artistBiography
                  yearFormed:(int)yearFormed {
    self = [super init];
    if (self) {
        _artistName = artistName;
        _artistBiography = artistBiography;
        _yearFormed = yearFormed;
    }
    return self;
}

@end
