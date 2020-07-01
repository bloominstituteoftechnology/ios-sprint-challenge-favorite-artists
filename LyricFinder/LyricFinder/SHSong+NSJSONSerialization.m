//
//  SHSong+NSJSONSerialization.m
//  LyricFinder
//
//  Created by Sean Hendrix on 3/1/19.
//  Copyright © 2019 Sean Hendrix. All rights reserved.
//

#import "SHSong+NSJSONSerialization.h"

@implementation SHSong (NSJSONSerialization)

- (instancetype)initFromDictionary:(NSDictionary *)dictionary songTitle:(NSString *)title artistName:(NSString *)artistName lyrics:(nonnull NSString *)lyrics rating:(NSInteger)rating
{
    return [[SHSong alloc] initWithTitle:title artist:artistName lyrics:lyrics rating:rating];
}

- (instancetype)initFromPlistDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSString *artistName = dictionary[@"artistName"];
    NSString *lyrics = dictionary[@"lyrics"];
    NSString *ratingString = dictionary[@"rating"];
    NSInteger rating = [ratingString integerValue];
    return [[SHSong alloc] initWithTitle:title artist:artistName lyrics:lyrics rating:rating];
}

- (NSDictionary *)songAsDictionary
{
    return [[NSDictionary alloc] initWithObjectsAndKeys:@[self.title, @"title", self.artist, @"artistName", self.lyrics, @"lyrics", [NSString stringWithFormat:@"%ld", (long)self.rating], @"rating"], nil];
}

@end
