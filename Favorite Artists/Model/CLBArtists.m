//
//  CLBArtists.m
//  Favorite Artists
//
//  Created by Christian Lorenzo on 5/30/20.
//  Copyright © 2020 Christian Lorenzo. All rights reserved.
//

#import "CLBArtists.h"

@implementation CLBArtists

- (instancetype)initWithArtist:(NSString *)artist biography:(NSString *)biography yearFromed:(int)yearFormed {
    
    self = [super init];
    if (self) {
        _artist = [artist copy];
        _biography = [biography copy];
        _yearFormed = yearFormed;
    }
    
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    NSString *artist = dictionary[@"strArtist"];
    NSString *biography = dictionary[@"strBiographyEN"];
    NSNumber *yearFormedNS = dictionary[@"intFormedYear"];
    
    if ([yearFormedNS isKindOfClass:[NSNull class]]) return nil;
    
    int yearFormed = yearFormedNS.intValue;
    
    return [self initWithArtist:artist biography:biography yearFromed:yearFormed];
}

@end
