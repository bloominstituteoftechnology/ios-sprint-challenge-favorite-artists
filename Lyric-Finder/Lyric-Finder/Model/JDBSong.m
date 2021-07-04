//
//  JDBSong.m
//  Lyric-Finder
//
//  Created by Madison Waters on 3/8/19.
//  Copyright © 2019 Jonah Bergevin. All rights reserved.
//

#import "JDBSong.h"

@implementation JDBSong

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist rating:(NSInteger)rating;
{
    self = [super init];
    if (self) {
        _title = title;
        _artist = artist;
        _rating = rating;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary title:(NSString  *)title artist:(NSString *)artist {
    title = [title copy];
    artist = [artist copy];
    rating = [rating copy];
    
    return [self initWithTitle:title artist:artist rating:rating];
            }

@end
