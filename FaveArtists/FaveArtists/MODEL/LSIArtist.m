//
//  LSIArtist.m
//  FaveArtists
//
//  Created by John Pitts on 7/19/19.
//  Copyright © 2019 johnpitts. All rights reserved.
//

#import "LSIArtist.h"

@implementation LSIArtist


- (instancetype)InitWithStrArtist:(NSString *)strArtist {
    self = [super init];
    if (self) {
        
        _strArtist = 
        
    }
}



- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        
        _strArtist = dictionary[@"artists"][@"strArtist"];
        _strBiographyEN = dictionary[@"artists"][@"strBiographyEN"];
        
        _intFormedYear = [dictionary[@"artists"][@"intFormedYear"] longValue];
                     //= (NSUInteger)yearInInt; // not sure what they want wrt using primitive but longValue is indeed primitive. also thought i remember someone saying Model objects cannot take primitives.  guess that wasn't true after all?
    }
    return self;
}



@end
