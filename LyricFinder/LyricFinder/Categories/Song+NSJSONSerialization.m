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
    NSDictionary *newDictionary = [[NSDictionary alloc]init];
    [newDictionary setValue:song.artist forKey: @"artist"];
    [newDictionary setValue:song.lyrics forKey: @"lyrics"];
    [newDictionary setValue:@(song.rating)
                     forKey: @"rating"];
    [newDictionary setValue:song.title forKey: @"title"];
    
    return newDictionary;
    
}

@end
