//
//  NNEArtist.m
//  FavoriteArtists
//
//  Created by Nonye on 7/17/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

#import "NNEArtist.h"

@implementation NNEArtist

- (instancetype)initWithName:(NSString *)name
                         bio:(NSString *)artistBio
                  yearFormed:(int)yearFormed {
    self = [super init];
    if (self) {
        _name = [name copy];
        _artistBio = [artistBio copy];
        _yearFormed = yearFormed;
    }

    return self;
}


@end
