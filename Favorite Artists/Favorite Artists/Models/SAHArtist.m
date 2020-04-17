//
//  SAHArtist.m
//  Favorite Artists
//
//  Created by scott harris on 4/17/20.
//  Copyright © 2020 scott harris. All rights reserved.
//

#import "SAHArtist.h"

@implementation SAHArtist

- (instancetype)initWithName:(NSString *)name yearFormed:(int)yearFormed biography:(NSString *)biography {
    self = [super init];
    if (self) {
        _name = name;
        _yearFormed = yearFormed;
        _biography = biography;
    }
    
    return self;
}

@end
