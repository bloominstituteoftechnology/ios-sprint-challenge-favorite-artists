//
//  FAFSong.m
//  FAFLyricFinder
//
//  Created by Farhan on 11/16/18.
//  Copyright © 2018 Farhan. All rights reserved.
//

#import "FAFSong.h"

@implementation FAFSong

- (instancetype)initWithName:(NSString *)name lyrics:(NSString *)lyrics artist:(NSString *)artist rating:(NSInteger)rating
{
    self = [super init];
    if (self) {
        _rating = rating;
        _songName = name;
        _lyrics = lyrics;
        _artist = artist;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary rating:(NSInteger)rating artist:(NSString *)artist songName:(NSString *)songName
{
    
    NSString *lyrics = dictionary[@"lyrics_body"];
    
    return [self initWithName:songName lyrics:lyrics artist:artist rating:rating];
    
}

@end
