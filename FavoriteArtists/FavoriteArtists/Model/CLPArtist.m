//
//  CLPArtist.m
//  FavoriteArtists
//
//  Created by Chad Parker on 7/31/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

#import "CLPArtist.h"

@implementation CLPArtist

- (instancetype)initWithName:(NSString *)name yearFormed:(int)yearFormed biography:(NSString *)biography
{
    if (self = [super init]) {
        _name = name;
        _yearFormed = yearFormed;
        _biography = biography;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *name = dictionary[@"strArtist"];
    if (![name isKindOfClass:NSString.class]) return nil;

    NSNumber *yearFormed = dictionary[@"intFormedYear"];
    //if (![yearFormed isKindOfClass:NSNumber.class]) return nil;

    NSString *biography = dictionary[@"strBiographyEN"];
    if (![biography isKindOfClass:NSString.class]) return nil;

    return [self initWithName:name yearFormed:yearFormed.intValue biography:biography];
}

@end
