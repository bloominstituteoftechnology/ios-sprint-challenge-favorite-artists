//
//  Artist.m
//  ios-FavoriteArtists-ObjectiveC-SprintChallenge
//
//  Created by BrysonSaclausa on 11/21/20.
//

#import "BRSArtist.h"

@implementation BRSArtist

- (instancetype)initWithName:(NSString *)name
                         bio:(NSString *)bio
                  yearFormed:(int)yearFormed
{
    if (self = [super init]) {
        _name = [name copy];
        _bio = [bio copy];
        _yearFormed = yearFormed;
    }
    return self;
}

@end
