//
//  MJRSong.m
//  Lyric Finder
//
//  Created by Moses Robinson on 3/29/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

#import "MJRSong.h"

@implementation MJRSong

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating
{
    self = [super init];
    
    if (self != nil) {
        
        _title = title;
        _artist = artist;
        _lyrics = lyrics;
        _rating = rating;
    }
    return self;
}

@end
