//
//  NELLyric+NELNSJSONSerialization.m
//  LyricFinder-Objc
//
//  Created by Nelson Gonzalez on 3/29/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

#import "NELLyric+NELNSJSONSerialization.h"

@implementation NELLyric (NELNSJSONSerialization)

- (instancetype)intiWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = [dictionary objectForKey:@"title"];
    NSString *artist = [dictionary objectForKey:@"artist"];
    NSString *lyrics = [dictionary objectForKey:@"lyrics"];
    NSNumber *rating = [dictionary objectForKey:@"rating"];
    
    return [[NELLyric alloc] initWithTitle:title artist:artist lyrics:lyrics rating:[rating intValue]];
}

- (NSDictionary *)lyricDictionary
{
    NSDictionary *dictionary = @{@"title" : self.title, @"artist" : self.artist, @"lyrics" : self.lyrics, @"rating" : @(self.rating)};
    return dictionary;
}

@end
