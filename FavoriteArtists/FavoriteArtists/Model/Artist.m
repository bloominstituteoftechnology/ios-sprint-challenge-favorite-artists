//
//  Artist.m
//  FavoriteArtists
//
//  Created by Elizabeth Thomas on 9/27/20.
//

#import "Artist.h"

@implementation Artist

- (instancetype)initWithArtistName:(NSString *)aName
                        yearFormed:(int)aYearFormed
                         biography:(NSString *)aBiography
{
    if (self = [super init]) {
        _name = aName.copy;
        _yearFormed = aYearFormed;
        _biography = aBiography.copy;
    }
    return self;
}

@end
