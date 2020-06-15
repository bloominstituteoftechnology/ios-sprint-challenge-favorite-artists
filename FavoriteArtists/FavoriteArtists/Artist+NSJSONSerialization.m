//
//  ArtistController+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Jessie Ann Griffin on 6/1/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

#import "Artist.h"

@implementation Artist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{

    NSString *name = dictionary[@"strArtist"];
    NSString *biography = dictionary[@"strBiographyEN"];
    NSNumber *year = dictionary[@"intFormedYear"];

    if ([year isKindOfClass:[NSNull class]]) {
        year = nil;
    }

    return [self initWithName:name.copy
                    biography:biography.copy
                   yearFormed:year.intValue];
}

- (NSDictionary *)toDictionary
{
    NSNumber *yearFormed = [NSNumber numberWithInt:self.yearFormed];
    NSDictionary *dictionary = @{
        @"strArtist" : self.artistName,
        @"intFormedYear" : yearFormed,
        @"strBiographyEN" : self.artistBiography
    };
    return dictionary;
}

@end
