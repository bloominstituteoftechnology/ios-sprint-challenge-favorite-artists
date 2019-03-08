//
//  LyricModel.m
//  Lyric Finder
//
//  Created by Lotanna Igwe-Odunze on 3/1/19.
//  Copyright © 2019 Sugabelly LLC. All rights reserved.
//

#import "LyricModel.h"

@implementation LyricModel

- (instancetype)init:(NSString *)song artist:(NSString *)musician lyrics:(NSString *)lyrics score:(int)rating {
    self = [super init];
    if (self != nil) {
        self.musician = musician;
        self.song = song;
        self.lyrics = lyrics;
        self.rating = rating;
    }
    return self;
}

@end
