//
//  IIISong.m
//  Lyric Finder
//
//  Created by Ilgar Ilyasov on 11/16/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "IIISong.h"

#define titleKey @"title"
#define artistKey @"artist"
#define lyricsKey @"lyrics"
#define ratingKey @"rating"

@implementation IIISong

- (instancetype)initWithTitle:(NSString *)title
                       artist:(NSString *)artist
                       lyrics:(NSString *)lyrics
                       rating:(int)rating
{
    self = [super init];
    if (self) {
        _title = title;
        _artist = artist;
        _lyrics = lyrics;
        _rating = rating;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.title forKey:titleKey];
    [aCoder encodeObject:self.artist forKey:artistKey];
    [aCoder encodeObject:self.lyrics forKey:lyricsKey];
    [aCoder encodeInt:self.rating forKey:ratingKey];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.title = [aDecoder decodeObjectForKey:titleKey];
        self.artist = [aDecoder decodeObjectForKey:artistKey];
        self.lyrics = [aDecoder decodeObjectForKey:lyricsKey];
        self.rating = [aDecoder decodeIntForKey:ratingKey];
    }
    
    return self;
}

@end
