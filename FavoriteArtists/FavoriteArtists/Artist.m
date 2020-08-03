//
//  Artist.m
//  FavoriteArtists
//
//  Created by Matthew Martindale on 8/2/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

#import "Artist.h"

@implementation Artist

- (instancetype)initWithArtistName:(NSString *)aName
                        yearFormed:(int)aYearFormed
                         biography:(NSString *)aBiography
{
    if (self = [super init])
    {
        _name = aName.copy;
        _yearFormed = aYearFormed;
        _biography = aBiography.copy;
    }
    return self;
}

@end
