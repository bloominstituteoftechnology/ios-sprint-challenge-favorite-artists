//
//  NPTArtist+NSJSONSerialization.m
//  Art
//
//  Created by Nick Nguyen on 4/17/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//
#import "NPTArtist.h"
#import "NPTArtist+NSJSONSerialization.h"

@implementation NPTArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *name = dictionary[@"strArtist"];
    NSString *bio = dictionary[@"strBiographyEN"];
    NSLog(@"%@", dictionary[@"intFormedYear"]);
    NSString *yearNumber = dictionary[@"intFormedYear"];
    if ([yearNumber isKindOfClass:[NSString class]] || [yearNumber isKindOfClass:[NSNumber class]]) {
        NSLog(@"%@", yearNumber);
        int year = [yearNumber intValue];
        return [self initWithName:name biography:bio yearFormed:year];
    } else {
        int year = 0;
        return [self initWithName:name biography:bio yearFormed:year];
    }
}

- (NSDictionary *)toDictionary {
    NSNumber *yearNum = [NSNumber numberWithInt:self.yearFormed];
    NSDictionary *dictionary = @{
        @"strArtist" : self.name,
        @"intFormedYear" : yearNum,
        @"strBiographyEN" : self.biography
    };
    return dictionary;
}

@end
