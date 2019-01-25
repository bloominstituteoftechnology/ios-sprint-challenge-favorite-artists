//
//  NSJSONSerialization+NKTNSJSONSerialization.m
//  lyricFinderObjc
//
//  Created by Nikita Thomas on 1/25/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

#import "NSJSONSerialization+NKTNSJSONSerialization.h"
#import "NKTSong.h"

@implementation NSJSONSerialization (NKTNSJSONSerialization)

- (NKTSong *)newSongWithDict:(NSDictionary *)dictionary title:(NSString *)title artist:(NSString *)artist rating:(NSInteger)rating
{
    NSString *lyrics = dictionary[@"lyrics_body"];
    
    return [[NKTSong alloc]initWithTitle:title artist:artist lyrics:lyrics rating:rating];
}


- (NSDictionary *)songToDict:(NKTSong *)song
{
    NSDictionary *songDict = [NSDictionary dictionaryWithObject:song forKey:song.title];
    return songDict;
}


@end
