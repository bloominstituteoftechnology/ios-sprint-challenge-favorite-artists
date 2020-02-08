//
//  JDKArtist.m
//  FavoriteArtist
//
//  Created by John Kouris on 2/8/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

#import "JDKArtist.h"

@implementation JDKArtist

- (instancetype)initWithName:(NSString *)name biography:(NSString *)biography yearFormed:(int)yearFormed
{
    if (self = [super init]) {
        _name = name;
        _yearFormed = yearFormed;
        _biography = biography;
    }
    return self;
}

@end
