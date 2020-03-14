//
//  NSObject+FAFNSJSONSerialization.m
//  FAFLyricFinder
//
//  Created by Farhan on 11/16/18.
//  Copyright © 2018 Farhan. All rights reserved.
//

#import "NSObject+FAFNSJSONSerialization.h"
#import "FAFSong.h"

@implementation NSObject (FAFNSJSONSerialization)

-(FAFSong *)initSongWithDictionary:(NSDictionary *)dictionary rating:(NSInteger)rating artist:(NSString *)artist songName:(NSString *)songName{
    
    NSString *lyrics = dictionary[@"lyrics_body"];
    
    return [[FAFSong alloc] initWithName:songName lyrics:lyrics artist:artist rating:rating];
    
}

-(NSDictionary *)getDictionaryFromSong:(FAFSong *)song
{
    NSDictionary *result = [NSDictionary dictionaryWithObject:song forKey:song.songName];
    return result;
}

@end
