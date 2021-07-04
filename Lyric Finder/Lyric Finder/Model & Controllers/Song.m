//
//  Song.m
//  Lyric Finder
//
//  Created by Madison Waters on 3/1/19.
//  Copyright © 2019 Jonah Bergevin. All rights reserved.
//

#import "Song.h"

@implementation Song

-(instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating
{
    self = [super init];
    if (self) {
        _title = [title copy];
        _artist = [artist copy];
        _lyrics = [lyrics copy];
        _rating = rating;
        
    }
    return self;
}

@end
