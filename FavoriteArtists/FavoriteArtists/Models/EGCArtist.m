//
//  EGCArtist.m
//  FavoriteArtists
//
//  Created by Enrique Gongora on 4/17/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

#import "EGCArtist.h"

@class EGCArtist;

@implementation EGCArtist

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
