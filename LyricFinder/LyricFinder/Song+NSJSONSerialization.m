//
//  Song+NSJSONSerialization.m
//  LyricFinder
//
//  Created by Austin Cole on 3/1/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import "Song+NSJSONSerialization.h"

@implementation Song (NSJSONSerialization)

- (NSDictionary *)songAsDictionary:(Song *)song {
    return @{
             @"artist" : song.artist,
             @"title" : song.title,
             @"lyrics" : song.lyrics,
             @"rating" : @(song.rating)
             };
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self != nil) {
        self.artist = [dictionary objectForKey: @"artist"];
        self.title = [dictionary  objectForKey: @"title"];
        self.lyrics = [dictionary objectForKey: @"lyrics"];
        self.rating = [[dictionary objectForKey: @"rating"] integerValue];
    }
    return self;
}

@end
