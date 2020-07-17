//
//  NNEArtist.m
//  FavoriteArtists
//
//  Created by Nonye on 7/17/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

#import "NNEArtist.h"

@implementation NNEArtist

- (instancetype)initWithartist:(NSString *)artist
                    yearFormed:(int)yearFormed
                   biography :(NSString *)biography {
    
    if (self = [super init]) {
        
        _artist = [artist copy];
        _yearFormed = yearFormed;
        _biography = [biography copy];
    }
    return self;
}

@end
