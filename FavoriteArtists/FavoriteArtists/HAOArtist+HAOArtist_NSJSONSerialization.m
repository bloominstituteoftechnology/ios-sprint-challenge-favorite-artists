//
//  HAOArtist+HAOArtist_NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Hunter Oppel on 6/12/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

#import "HAOArtist+HAOArtist_NSJSONSerialization.h"

@implementation HAOArtist (HAOArtist_NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSArray *artists = dictionary[@"artists"];
    NSDictionary *firstArtist = artists.firstObject;
    
    NSString *artistName = firstArtist[@"strArtist"];
    NSString *artistBiography = firstArtist[@"strBiographyEN"];
    NSNumber *yearFormedNumber = firstArtist[@"intFormedYear"];
    
    if (!(artistName || artistBiography || yearFormedNumber)) {
        return nil;
    }
    
    self = [self initWithArtistName:artistName artistBiography:artistBiography yearFormed:yearFormedNumber.intValue];
    
    return self;
}

@end
