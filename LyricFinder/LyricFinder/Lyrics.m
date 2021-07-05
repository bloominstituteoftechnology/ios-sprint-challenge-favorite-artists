//
//  Lyrics.m
//  LyricFinder
//
//  Created by Austin Cole on 3/1/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import "Lyrics.h"

@implementation Lyrics

- (instancetype)init
{
    self = [super init];
    if (self) {
        _lyricsBody = [[NSString alloc] init];
    }
    return self;
}

@end
