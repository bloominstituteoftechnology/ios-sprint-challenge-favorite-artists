//
//  Song.m
//  LyricFinder
//
//  Created by Carolyn Lea on 10/5/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

#import "Song.h"

@implementation Song

-(instancetype)initWithArtist:(NSString *)artist title:(NSString *)title lyrics:(NSString *)lyrics rating:(NSInteger)rating
{
    self = [super init];
    if (self)
    {
        _artist = artist;
        _title = title;
        _lyrics = lyrics;
        _rating = rating;
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *artist = dictionary[@"artist_name"];
    NSString *title = dictionary[@"track_name"];
    NSString *lyrics = dictionary[@"lyrics_body"];
    NSString *ratingKey = dictionary[@"track_rating"];
    NSInteger rating = [dictionary[ratingKey] integerValue];
    
    return [self initWithArtist:artist title:title lyrics:lyrics rating:rating];
}

@end
