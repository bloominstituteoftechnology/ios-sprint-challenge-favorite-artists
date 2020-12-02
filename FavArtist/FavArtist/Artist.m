//
//  Artist.m
//  FavArtist
//
//  Created by Norlan Tibanear on 11/30/20.
//

#import "Artist.h"

@implementation Artist

- (instancetype)initWithArtistName:(NSString *)aName
                         artistBio:(NSString *)aBio
                        formedYear:(int)aYear
{
    if (self = [super init]) {
        _artistName = aName.copy;
        _artistBio = aBio.copy;
        _formedYear = aYear;
    }
    return self;
}



@end
