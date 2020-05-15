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

+ (instancetype)initWithDictionary:(NSDictionary *)dictionary {

    NSString *artist     = dictionary[@"artist"];
    NSString *biography  = dictionary[@"biography"];
    NSNumber *formedYear = dictionary[@"formedYear"];

    if ([formedYear isKindOfClass:[NSNull class]]) { formedYear = nil; }

    // The required elements
    if (formedYear == nil) {
        formedYear = [NSNumber numberWithDouble:-1];
    }

    return [[MTGArtist alloc] initWithArtist:artist
                                   biography:biography
                                  formedYear:formedYear.doubleValue
            ];
}

+ (NSDictionary *)toDictionary {
    return nil;
}

@end
