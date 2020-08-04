//
//  JMCArtist.m
//  FavoriteArtists
//
//  Created by Jarren Campos on 8/3/20.
//  Copyright © 2020 Jarren Campos. All rights reserved.
//

#import "JMCArtist.h"

@implementation JMCArtist

- (instancetype)initWithName:(NSString *)name biography:(NSString *)biography yearFormed:(int)yearFormed {
    if (self = [super init]) {
        _name = name;
        _biography = biography;
        _yearFormed = yearFormed;
    }
    return self;
}

@end
