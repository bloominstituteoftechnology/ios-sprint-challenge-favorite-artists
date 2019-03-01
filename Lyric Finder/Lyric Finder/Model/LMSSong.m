//
//  LMSSong.m
//  Lyric Finder
//
//  Created by Lisa Sampson on 3/1/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

#import "LMSSong.h"

@implementation LMSSong

- (instancetype)initWithArtist:(NSString *)artist andTrackName:(NSString *)trackName andLyrics:(NSString *)lyrics andRating:(int)rating {
    self = [super init];
    
    if (self != nil) {
        _artist = artist;
        _trackName = trackName;
        _lyrics = lyrics;
        _rating = rating;
    }
    return self;
}

@end
