//
//  Artist.m
//  FavoriteArtists
//
//  Created by Clayton Watkins on 9/25/20.
//

#import "Artist.h"

@implementation Artist

- (instancetype)initWithArtistName:(NSString *)aName
                         artistBio:(NSString *)aBio
                        yearFormed:(int)aYear
{
    if (self = [super init]) {
        _artistName = aName.copy;
        _artistBio = aBio.copy;
        _yearFormed = aYear;
    }
    return self;
}

@end
