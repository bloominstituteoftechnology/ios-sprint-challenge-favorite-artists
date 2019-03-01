//
//  BHSong.m
//  LyricFinder
//
//  Created by Benjamin Hakes on 3/1/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import "BHSong.h"

@implementation BHSong

- (instancetype)init{
    self = [super init];
    if (self) {
        _title = @"";
        _artist = @"";
        _lyrics = @"";
        _rating = 0;
    }
    return self;
}

@end
