//
//  Artist.m
//  FavArtist
//
//  Created by Norlan Tibanear on 11/30/20.
//

#import "Artist.h"


@implementation Artist

- (instancetype)initWithArtistName:(NSString *)aName
                        formedYear:(int)aYear
                         biography:(NSString *)aBiography
{
    if (self = [super init]) {
        _artistName = aName.copy;
        _formedYear = aYear;
        _biography = aBiography.copy;
    }
    return self;
}

@end
