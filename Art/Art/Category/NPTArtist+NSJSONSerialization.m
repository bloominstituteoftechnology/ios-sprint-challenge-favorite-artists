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

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *name = dictionary[@"strArtist"];
    NSString *bio = dictionary[@"strBiographyEN"];
    NSLog(@"%@", dictionary[@"intFormedYear"]);
    NSNumber *yearNumber = dictionary[@"intFormedYear"];
    
    return [self initWithName:name biography:bio yearFormed:yearNumber.intValue];
    
}

- (NSDictionary *)toDictionary
{
    NSNumber *yearNum = [NSNumber numberWithInt:self.yearFormed];
    NSDictionary *dictionary = @{
        @"strArtist" : self.name,
        @"intFormedYear" : yearNum,
        @"strBiographyEN" : self.biography
    };
    return dictionary;
}

@end
