//
//  JTMSongLyrics+NSJSONSerialization.m
//  Lyric Finder
//
//  Created by Jonathan T. Miles on 10/5/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

#import "JTMSongLyrics+NSJSONSerialization.h"

@implementation JTMSongLyrics (NSJSONSerialization)

- (instancetype)initFromDictionary:(NSDictionary *)dictionary title:(nonnull NSString *)title artist:(nonnull NSString *)artist
{
    NSString *lyrics = dictionary[@"lyrics_body"];
    
    return [self initWithTitle:title artist:artist lyrics:lyrics rating:0];
}

@end
