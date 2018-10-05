//
//  CGASong.m
//  ios-lyric-finder
//
//  Created by Conner on 10/5/18.
//  Copyright © 2018 Conner. All rights reserved.
//

#import "CGASong.h"

@implementation CGASong

- (instancetype)initWithSong:(NSString *)song artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(int)rating {
    self = [super init];
    if (self) {
        _song = song;
        _artist = artist;
        _lyrics = lyrics;
        _rating = rating;
    }
    return self;
}

@end
