//
//  DMOArtist.m
//  DMOArtistsWeek14SprintChallenge
//
//  Created by morse on 1/24/20.
//  Copyright © 2020 morse. All rights reserved.
//

#import "DMOArtist.h"

@implementation DMOArtist

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
