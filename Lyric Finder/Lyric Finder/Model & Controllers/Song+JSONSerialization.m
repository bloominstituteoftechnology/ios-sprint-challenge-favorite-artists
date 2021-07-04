//
//  Song+JSONSerialization.m
//  Lyric Finder
//
//  Created by Madison Waters on 3/1/19.
//  Copyright © 2019 Jonah Bergevin. All rights reserved.
//

#import "Song+JSONSerialization.h"

@implementation Song (JSONSerialization)

-(instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist
{
    self = [super init];
    if (self) {
        title = title;
        artist = artist;
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSString *artist = dictionary[@"artist"];
    return [self initWithTitle:title artist:artist];
}

@end
