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
    NSDictionary *newDictionary = [[NSDictionary alloc] init];
    newDictionary = @{
                      @"artist" : song.artist,
                      @"title" : song.title,
                      @"lyrics" : song.lyrics,
                      @"rating" : @(song.rating)
                      };
    
    return newDictionary;
    
}

@end
