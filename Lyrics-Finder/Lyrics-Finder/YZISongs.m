//
//  YZISongs.m
//  Lyrics-Finder
//
//  Created by Yvette Zhukovsky on 1/25/19.
//  Copyright © 2019 Yvette Zhukovsky. All rights reserved.
//


#import "YZISongs.h"

#define titleKey @"title"
#define artistKey @"artist"
#define lyricsKey @"lyrics"
#define ratingKey @"rating"


@implementation YZISongs

- (instancetype)initWithTitle:(NSString *)title
                       artist:(NSString *)artist
                       lyrics:(NSString *)lyrics
                       rating:(int)rating
{
    self = [super init];
    if (self) {
        _title = title;
        _artistName = artist;
        _lyrics = lyrics;
        _rating = rating;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.title forKey:titleKey];
    [aCoder encodeObject:self.artistName forKey:artistKey];
    [aCoder encodeObject:self.lyrics forKey:lyricsKey];
    [aCoder encodeInt:self.rating forKey:ratingKey];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.title = [aDecoder decodeObjectForKey:titleKey];
        self.artistName = [aDecoder decodeObjectForKey:artistKey];
        self.lyrics = [aDecoder decodeObjectForKey:lyricsKey];
        self.rating = [aDecoder decodeIntForKey:ratingKey];
    }
    
    return self;
}




@end


