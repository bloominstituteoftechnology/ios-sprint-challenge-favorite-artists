//
//  HMRArtist+NSJSONSerialization.m
//  FavoriteArtist
//
//  Created by Harmony Radley on 7/17/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

#import "HMRArtist+NSJSONSerialization.h"

@implementation HMRArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {

    NSArray *artistArray = dictionary[@"artists"];

    if (![artistArray isKindOfClass:[NSArray class]]) {
        NSLog(@"artistArray is not of class NSArray");
        return nil;
    }

    NSString *artist = artistArray[0][@"strArtist"];
    NSNumber *yearFormed = artistArray[0][@"intFormedYear"];
    NSString *biography = artistArray[0][@"strBiographyEN"];

    if ([yearFormed isKindOfClass:[NSNull class]]) {
        yearFormed = nil;
        NSLog(@"yearFormed is null: %@", dictionary);
    }

    if (!artist || !biography) {
        NSLog(@"missing something in the category");
        return nil;
    }

    self = [[HMRArtist alloc] initWithArtist:artist yearFormed:yearFormed.intValue biography:biography];

    return self;
}

- (instancetype)initWithDict:(NSDictionary *)dict {

    NSString *artist = dict[@"strArtist"];
    NSNumber *yearFormed = dict[@"intFormedYear"];
    NSString *biography = dict[@"strBiographyEN"];

    self = [[HMRArtist alloc] initWithArtist:artist
                                          yearFormed:yearFormed.intValue
                                           biography:biography];

    return self;
}

- (NSDictionary *)toDictionary {

    NSDictionary *dictionary = @{
        @"strArtist": self.artist,
        @"intFormedYear": [NSNumber numberWithInt:self.yearFormed],
        @"strBiographyEN": self.biography
    };

    return dictionary;
}

@end
