//
//  MTGArtist+NSJSONSerialization.m
//  Favorite Artists
//
//  Created by Mark Gerrior on 5/15/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

#import "MTGArtist+NSJSONSerialization.h"

@class MTGArtist;

@implementation MTGArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {

    // No result is returned as: {"artists":null}
    // Test for that here.
    if ([dictionary[@"artists"] isKindOfClass:[NSNull class]]) { return nil; }

    NSArray  *artistsArray = dictionary[@"artists"];
    // FIXME: What about 0 objects?
    NSDictionary *artistDictionary = artistsArray[0];

    NSString *artist     = artistDictionary[@"strArtist"];
    NSString *biography  = artistDictionary[@"strBiographyEN"];
    NSNumber *formedYear = artistDictionary[@"intFormedYear"];

    if ([formedYear isKindOfClass:[NSNull class]]) { formedYear = nil; }

    // The required elements
    if (formedYear == nil) {
        formedYear = [NSNumber numberWithInt:-1];
    }

    return [[MTGArtist alloc] initWithArtist:artist
                                   biography:biography
                                  formedYear:formedYear.intValue
            ];
}

- (NSDictionary *)toDictionary {
//    NSDictionary *codingKeys = @{
//        @"artist": @"strArtist",
//        @"biography": @"strBiographyEN",
//        @"formedYear": @"intFormedYear",
//    };
    NSDictionary *codingKeys;

    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];

    for (NSString *codingKey in [codingKeys keyEnumerator]) {

        NSString *key = [codingKeys objectForKey:codingKey];
        id value = [self valueForKey:codingKey];
        [dictionary setValue:value forKey:key];
    }

    return [dictionary copy];
}

@end
