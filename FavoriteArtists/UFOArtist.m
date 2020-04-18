//
//  UFOArtist.m
//  FavoriteArtists
//
//  Created by Ufuk Türközü on 17.04.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

#import "UFOArtist.h"

@implementation UFOArtist

- (instancetype)initWithName:(NSString *)name
                        yearFormed:(int long)yearFormed
                   biography:(NSString *)biography {
    
    self = [super init];
    if (self) {
        _name = [name copy];
        _yearFormed = yearFormed;
        _biography = [biography copy];
    }
    return self;
}

@end
