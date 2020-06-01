//
//  Artist.m
//  Favorite Artists
//
//  Created by David Wright on 5/31/20.
//  Copyright © 2020 David Wright. All rights reserved.
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
