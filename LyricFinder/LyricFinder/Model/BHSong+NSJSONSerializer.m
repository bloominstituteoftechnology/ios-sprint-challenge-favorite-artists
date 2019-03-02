//
//  BHSong+NSJSONSerializer.m
//  LyricFinder
//
//  Created by Benjamin Hakes on 3/1/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import "BHSong+NSJSONSerializer.h"

@implementation BHSong (NSJSONSerializer)

-(NSDictionary *)makeDictionaryFromSong: (BHSong *)song{
    
    NSDictionary *bottomLevelDictionary = [NSDictionary dictionaryWithObjectsAndKeys: song.title, @"title", song.artist, @"artist", @(song.rating), @"rating", song.UUID, @"uuid", song.lyrics, @"lyrics", nil];
    
    return bottomLevelDictionary;
}

    
@end
