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
        _UUID = [[NSUUID UUID] UUIDString];
        _title = @"";
        _artist = @"";
        _lyrics = @"";
    }
    return self;
}

- (instancetype)initWithTitle: (NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics uuid:(NSString *)uuid{
    self = [super init];
    if (self) {
        _UUID = uuid;
        _title = title;
        _artist = artist;
        _lyrics = lyrics;
    }
    return self;
}

@end
