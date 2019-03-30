//
//  MJRSong+NSJSONSerialization.m
//  Lyric Finder
//
//  Created by Moses Robinson on 3/29/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

#import "MJRSong+NSJSONSerialization.h"

@implementation MJRSong (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    
    NSString *title = dictionary[@"title"];
    NSString *artist = dictionary[@"artist"];
    NSString *lyrics = dictionary[@"lyrics"];
    NSNumber *ratingObject = dictionary[@"rating"];
    NSInteger rating = [ratingObject integerValue];
    
    return [[MJRSong alloc] initWithTitle:title artist:artist lyrics:lyrics rating:rating];
}

- (NSDictionary *)dictionaryFromObject
{
    
    NSNumber *rating = [NSNumber numberWithDouble:self.rating];

    return @{
             @"title" : self.title,
             @"artist" : self.artist,
             @"lyrics" : self.lyrics,
             @"rating" : rating
             };
}

@end
