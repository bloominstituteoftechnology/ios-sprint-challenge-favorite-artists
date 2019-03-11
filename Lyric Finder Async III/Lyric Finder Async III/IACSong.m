//
//  IACSong.m
//  Lyric Finder Async III
//
//  Created by Ivan Caldwell on 3/10/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

#import "IACSong.h"

@implementation IACSong

- (instancetype)initWithSongTitle:(NSString *)title
                           artist:(NSString *)artist
                           lyrics:(NSString *)lyrics
                           rating:(int)rating
{
    self = [super init];
    if (self) {
        _title = title;
        _artist = artist;
        _lyrics = lyrics;
        _rating = rating;
    }
    return self;
}
@end
