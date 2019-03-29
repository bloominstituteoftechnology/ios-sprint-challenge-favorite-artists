//
//  NELLyric.m
//  LyricFinder-Objc
//
//  Created by Nelson Gonzalez on 3/29/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

#import "NELLyric.h"

@implementation NELLyric

- (instancetype)intiWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = [dictionary objectForKey:@"title"];
    NSString *artist = [dictionary objectForKey:@"artist"];
    NSString *lyrics = [dictionary objectForKey:@"lyrics"];
    NSNumber *rating = [dictionary objectForKey:@"rating"];
    
    return [self initWithTitle:title artist:artist lyrics:lyrics rating:[rating intValue]];
}

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(int)rating
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
