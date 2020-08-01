//
//  CLPArtist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Chad Parker on 7/31/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

#import "CLPArtist+NSJSONSerialization.h"

@implementation CLPArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *name = dictionary[@"strArtist"];
    if (![name isKindOfClass:NSString.class]) return nil;

    NSNumber *yearFormed = dictionary[@"intFormedYear"];
    if (![yearFormed isKindOfClass:NSNumber.class]) return nil;

    NSString *biography = dictionary[@"strBiographyEN"];
    if (![biography isKindOfClass:NSString.class]) return nil;

    return [self initWithName:name yearFormed:yearFormed.intValue biography:biography];
}

- (NSDictionary *)toDictionary
{
#warning implement
    return [[NSDictionary alloc] init];
}

@end
