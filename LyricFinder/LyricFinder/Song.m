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
        _artist = [artist copy];
        _title = [title copy];
        _lyrics = [lyrics copy];
        _rating = rating;
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
//    NSString *artist = dictionary[@"artist_name"];
//    NSString *title = dictionary[@"track_name"];
//    NSString *lyrics = dictionary[@"lyrics_body"];
//    NSString *ratingKey = dictionary[@"track_rating"];
//    NSInteger rating = [dictionary[ratingKey] integerValue];
    
    NSString *title = dictionary[titleKey];
    NSString *artist = dictionary[artistKey];
    NSString *lyrics = dictionary[lyricsKey];
    NSInteger rating = [dictionary[ratingKey] integerValue];
    
    return [self initWithArtist:artist title:title lyrics:lyrics rating:rating];
}

-(NSDictionary *)dictionaryRepresentation
{
    return @{titleKey: self.title,
             artistKey: self.artist,
             lyricsKey: self.lyrics,
             ratingKey: [NSNumber numberWithInteger:self.rating]};
}

static NSString const *titleKey = @"title";
static NSString const *artistKey = @"artist";
static NSString const *lyricsKey = @"lyrics";
static NSString const *ratingKey = @"rating";

@end
