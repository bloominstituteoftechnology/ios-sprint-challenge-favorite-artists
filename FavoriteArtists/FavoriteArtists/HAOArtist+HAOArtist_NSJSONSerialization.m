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
    if ([artists isEqual:[NSNull null]]) {
        return nil;
    }
    NSDictionary *firstArtist = artists.firstObject;
    
    NSString *artistName = firstArtist[@"strArtist"];
    NSString *artistBiography = firstArtist[@"strBiographyEN"];
    NSNumber *yearFormedNumber = firstArtist[@"intFormedYear"];
    NSString *yearFormedString = @"";
    
    if (![yearFormedNumber isEqual:[NSNull null]]) {
        yearFormedString = [NSString stringWithFormat:@"Formed in %@", yearFormedNumber];
    } else {
        yearFormedString = @"No formed year found";

    }
    
    if ([artistName isEqual:[NSNull null]] || [artistBiography isEqual:[NSNull null]]) {
        return nil;
    }
    
    self = [self initWithArtistName:artistName artistBiography:artistBiography yearFormed:yearFormedString];
    
    return self;
}

@end
