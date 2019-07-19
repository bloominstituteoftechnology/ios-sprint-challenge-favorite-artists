//
//  LSIArtist.m
//  FaveArtists
//
//  Created by John Pitts on 7/19/19.
//  Copyright © 2019 johnpitts. All rights reserved.
//

#import "LSIArtist.h"

@implementation LSIArtist

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        
        _strArtist = dictionary[@"artists"][@"strArtist"];
        _strBiographyEN = dictionary[@"artists"][@"strBiographyEN"];
        
        long yearInInt = [dictionary[@"artists"][@"intFormedYear"] longValue];
        _intFormedYear = (NSUInteger)yearInInt;
    }
    return dictionary;
}

@end
