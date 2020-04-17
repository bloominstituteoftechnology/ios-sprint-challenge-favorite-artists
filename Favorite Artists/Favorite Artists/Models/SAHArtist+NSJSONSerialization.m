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
    NSString *name = dictionary[@"strArtist"];
    NSNumber *yearNumber = dictionary[@"intFormedYear"];
    NSString *bio = dictionary[@"strBiographyEN"];
    
    if ([yearNumber isKindOfClass:[NSNull class]]) {
        self = [self initWithName:name yearFormed:0 biography:bio];
    } else {
       self = [self initWithName:name yearFormed:yearNumber.intValue biography:bio];
    }
    
    return self;
}

- (NSDictionary *)toDictionary {
    NSNumber *year = [NSNumber numberWithInt:self.yearFormed];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setObject:self.name forKey:@"strArtist"];
    [dictionary setObject:[year stringValue] forKey:@"intFormedYear"];
    [dictionary setObject:self.biography forKey:@"strBiographyEN"];
    return dictionary;
    
}

@end
