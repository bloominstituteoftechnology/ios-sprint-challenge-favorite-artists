//
//  VVSArtist.m
//  Favorite Artists
//
//  Created by Vici Shaweddy on 2/7/20.
//  Copyright © 2020 Vici Shaweddy. All rights reserved.
//

#import "VVSArtist.h"

@implementation VVSArtist

- (instancetype)initWithName:(NSString *)name
                  formedYear:(NSUInteger)formedYear
                   biography:(NSString *)biography
{
    if (self = [super init]) {
        _name = name;
        _formedYear = formedYear;
        _biography = biography;
    }
    return self;
}

@end
