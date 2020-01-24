//
//  JPHArtist.m
//  FavoriteArtistSprint
//
//  Created by Jerry haaser on 1/24/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

#import "JPHArtist.h"

@implementation JPHArtist

- (instancetype)initWithArtistName: (NSString *)artistName bio:(NSString *)bio yearFormed:(int)yearFormed {
    if (self = [self init]) {
        _artistName = artistName;
        _bio = bio;
        _yearFormed = yearFormed;
    }
    return self;
}

@end
