//
//  JLMSong+NSJSONSerialization.m
//  LyricFinder
//
//  Created by Jason Modisett on 1/25/19.
//  Copyright © 2019 Jason Modisett. All rights reserved.
//

#import "JLMSong+NSJSONSerialization.h"

@implementation JLMSong (NSJSONSerialization)

- (instancetype)initFromDictionary:(NSDictionary *)dictionary songTitle:(NSString *)title artistName:(NSString *)artistName lyrics:(nonnull NSString *)lyrics rating:(NSInteger)rating
{
    return [[JLMSong alloc] initWithTitle:title artist:artistName lyrics:lyrics rating:rating];
}

- (instancetype)initFromPlistDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSString *artistName = dictionary[@"artistName"];
    NSString *lyrics = dictionary[@"lyrics"];
    NSString *ratingString = dictionary[@"rating"];
    NSInteger rating = [ratingString integerValue];
    return [[JLMSong alloc] initWithTitle:title artist:artistName lyrics:lyrics rating:rating];
}

- (NSDictionary *)songAsDictionary
{
    return [[NSDictionary alloc] initWithObjectsAndKeys:@[self.title, @"title", self.artist, @"artistName", self.lyrics, @"lyrics", [NSString stringWithFormat:@"%ld", (long)self.rating], @"rating"], nil];
}

@end
