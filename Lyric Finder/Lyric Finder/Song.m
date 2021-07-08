//
//  Song.m
//  Lyric Finder
//
//  Created by Sean Hendrix on 1/25/19.
//  Copyright © 2019 Sean Hendrix. All rights reserved.
//

#import "Song.h"

@implementation Song

-(instancetype) initWithTitle: (NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger *)rating
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

-(instancetype) initWithDictionary: (NSDictionary *)dictionary;
{
    NSInteger *rating = [dictionary[@"rating"] integerValue];
    NSString *artist = dictionary[@"artist"];
    NSString *title = dictionary[@"title"];
    NSString *lyrics = dictionary[@"lyrics"];
    
    return [self initWithTitle:title artist:artist lyrics:lyrics rating:rating];
}

@end
