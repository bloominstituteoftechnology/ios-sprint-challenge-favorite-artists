//
//  HMRArtist.m
//  FavoriteArtist
//
//  Created by Harmony Radley on 7/17/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

#import "HMRArtist.h"

@implementation HMRArtist

- (instancetype)initWithArtist:(NSString *)artist
                    yearFormed:(int)yearFormed
                     biography:(NSString *)biography
{
     self = [super init];
    if (self) {
        _artist = artist;
        _yearFormed = yearFormed;
        _biography = biography;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {

    NSString *artist = dictionary[@"strArtist"];
    NSString *biography = dictionary[@"strBiographyEN"];
    NSNumber *yearFormed = dictionary[@"intFormedYear"];

    if ([yearFormed isKindOfClass:[NSNull class]]) { yearFormed = nil; }

    int yearlyFormed = yearFormed.intValue;

    return [self initWithArtist:artist yearFormed:yearFormed biography:biography];
}

@end
