//
//  SAHArtist+NSJSONSerialization.m
//  Favorite Artists
//
//  Created by scott harris on 4/17/20.
//  Copyright © 2020 scott harris. All rights reserved.
//

#import "SAHArtist+NSJSONSerialization.h"

@implementation SAHArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSArray *artists = dictionary[@"artists"];
    NSDictionary *artist = artists.firstObject;
    NSString *name = artist[@"strArtist"];
    NSNumber *yearNumber = artist[@"intFormedYear"];
    NSString *bio = artist[@"strBiographyEN"];
    
    self = [self initWithName:name yearFormed:yearNumber.intValue biography:bio];
    
    return self;
}

@end
