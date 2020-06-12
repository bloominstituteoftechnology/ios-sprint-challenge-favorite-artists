//
//  HAOArtist.m
//  FavoriteArtists
//
//  Created by Hunter Oppel on 6/12/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

#import "HAOArtist.h"

@implementation HAOArtist

- (instancetype)initWithArtistName:(NSString *)artistName artistBiography:(NSString *)artistBiography yearFormed:(int)yearFormed
{
    self = [super init];
    if (self) {
        _artistName = artistName;
        _artistBiography = artistBiography;
        _yearFormed = yearFormed;
    }
    return self;
}

@end
