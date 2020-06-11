//
//  NSObject+WASArtist_NSJSONSerialization.m
//  FavoriteArtists_OBJC
//
//  Created by Alex Shillingford on 2/21/20.
//  Copyright © 2020 shillwil. All rights reserved.
//

#import "WASArtist.h"
#import "NSObject+WASArtist_NSJSONSerialization.h"

@implementation WASArtist (WASArtist_NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *name = dictionary[@"strArtist"];
    NSString *biography = dictionary[@"strBiographyEN"];
    NSString *yearFormed = dictionary[@"intFormedYear"];//yearInt;
    if ([yearFormed isKindOfClass:[NSString class]] || [yearFormed isKindOfClass:[NSNumber class]]) {
        int year = [yearFormed intValue];
        return [self initWithName:name biography:biography yearFormed:year];
    } else {
        int year = 0;
        return [self initWithName:name biography:biography yearFormed:year];
    }
}

- (NSDictionary *)aDictionary {
    NSNumber *year = [NSNumber numberWithInt:self.yearFormed];
    NSDictionary *dictionary = @{
        @"strArtist" : self.name,
        @"intFormedYear" : year,
        @"strBiographyEN" : self.biography
    };
    return dictionary;
}

@end
