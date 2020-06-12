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
    NSDictionary *artistDictionary = [dictionary objectForKey:@"artists"]; //this key might return an array
    if (![dictionary isKindOfClass:[NSDictionary class]]) return nil;

    NSString *name = [artistDictionary objectForKey:@"strArtist"];
    if (![name isKindOfClass:[NSString class]]) return nil;

    NSString *biography = [artistDictionary objectForKey:@"strBiographyEN"];
    if (![biography isKindOfClass:[NSString class]]) return nil;

    NSNumber *year = [artistDictionary objectForKey:@"intFormedYear"];
    if (![year isKindOfClass:[NSNumber class]]) return nil;

    return [self  initWithName:name.copy
                     biography:biography.copy
                    yearFormed:year.intValue];
}

- (NSDictionary *)toDictionary
{

//    NSString *name = dictionary[@"strArtist"];
//    NSString *biography = dictionary[@"strBiographyEN"];
//    NSNumber *year = dictionary[@"intFormedYear"];
//
//    if ([year isKindOfClass:[NSNull class]]) {
//        year = nil;
//    }
//
//    return [[Artist alloc] initWithName:name.copy
//                              biography:biography.copy
//                             yearFormed:year.intValue];
    return [NSDictionary dictionaryWithObject:self forKey:@"artists"];
}

@end
