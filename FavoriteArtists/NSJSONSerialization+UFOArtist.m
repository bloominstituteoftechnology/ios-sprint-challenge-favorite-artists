//
//  NSJSONSerialization+UFOArtist.m
//  FavoriteArtists
//
//  Created by Ufuk Türközü on 17.04.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

#import "NSJSONSerialization+UFOArtist.h"
#import "UFOAPIController.h"


@implementation NSJSONSerialization (UFOArtist)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    NSArray *artists = dictionary[@"artists"];
    NSString *strArtist = artists.firstObject[@"strArtist"];
    NSNumber *intFormedYear = artists.firstObject[@"intFormedYear"];
    NSString *strBiographyEN = artists.firstObject[@"strBiographyEN"];
    
    
    return self;
}

- (NSDictionary *)toDictionary {
    
    return self;
}


@end
