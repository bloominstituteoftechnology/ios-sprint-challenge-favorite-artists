//
//  Artist.m
//  Favorite Artist
//
//  Created by Gerardo Hernandez on 8/8/20.
//  Copyright © 2020 Gerardo Hernandez. All rights reserved.
//

#import "Artist.h"

@implementation Artist

- (instancetype)initWithName:(NSString *)name yearFormed:(int)yearFormed biography:(NSString *)biography
{
    if (self = [super init]) {
        _name = name.copy;
        _yearFormed = yearFormed;
        _biography = biography.copy;
    }
    return self;
}

@end
