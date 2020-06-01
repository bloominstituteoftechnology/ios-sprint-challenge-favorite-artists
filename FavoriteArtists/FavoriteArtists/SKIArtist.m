//
//  SKIArtist.m
//  FavoriteArtists
//
//  Created by Joshua Rutkowski on 5/31/20.
//

#import "SKIArtist.h"

@implementation SKIArtist

- (instancetype)initWithName:(NSString *)name
                        year:(int)year
                       about:(NSString *)about {
    self = [super init];
    if (self) {
        _name = [name copy];
        _year = year;
        _about = [about copy];
    }
    return self;
}

@end
