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

    



@end
