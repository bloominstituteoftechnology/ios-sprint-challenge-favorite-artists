//
//  IACLyric.m
//  Lyric Finder
//
//  Created by Ivan Caldwell on 3/1/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

#import "IACLyric.h"

@implementation IACLyric

- (instancetype)initWithTitle:(NSString *)title
                       artist:(NSString *)artist
                       lyrics:(NSString *)lyrics
                       rating:(NSInteger)rating
{
    self = [super init];
    if (self)
    {
        _title = title;
        _artist = artist;
        _lyrics = lyrics;
        _rating = rating;
        //Implicit conversion of 'NSInteger' (aka 'long') to 'NSString * _Nonnull' is disallowed with ARC
        //Messing up somewhere...??? --- I called the rating a NSString in the header file... facepalm...
    }
    return self;
}
@end
