//
//  NKTSong.m
//  lyricFinderObjc
//
//  Created by Nikita Thomas on 1/25/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

#import "NKTSong.h"

@implementation NKTSong

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating
{
    self = [super init];
    if (self) {
        _rating = rating;
        _title = title;
        _lyrics = lyrics;
        _artist = artist;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary title:(NSString *)title artist:(NSString *)artist rating:(NSInteger)rating
{
    NSString *lyrics = dictionary[@"lyrics_body"];
    
    return [self initWithTitle:title artist:artist lyrics:lyrics rating:rating];
}





@end
