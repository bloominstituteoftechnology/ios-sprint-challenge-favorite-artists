//
//  JSKArtist.m
//  FavoriteArtists
//
//  Created by Josh Kocsis on 9/25/20.
//

#import "JSKArtist.h"

@implementation JSKArtist

- (instancetype)initWithArtistName:(NSString *)aArtistName
                        artistBio:(NSString *)aArtistBio
                       yearFormed:(int)aYearFormed
{
    if (self = [super init]) {
        _artistName = aArtistName.copy;
        _artistBio = aArtistBio.copy;
        NSNumber *yearFormedInt = [NSNumber numberWithInt:aYearFormed];
        _yearFormed = yearFormedInt;
    }
    return self;
}


@end
