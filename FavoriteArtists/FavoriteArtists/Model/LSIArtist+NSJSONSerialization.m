//
//  LSIArtist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Shawn Gee on 5/15/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

#import "LSIArtist+NSJSONSerialization.h"

static NSDictionary *codingKeys;

@implementation LSIArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        
        if (!codingKeys) {
            codingKeys = @{
                @"name": @"strArtist",
                @"biography": @"strBiographyEN",
                @"yearFormed": @"intFormedYear",
            };
        }
        
        for (NSString *codingKey in [codingKeys keyEnumerator]) {
            
            NSString *key = [codingKeys objectForKey:codingKey];
            id value = [dictionary objectForKey:key];
            
            // Transform NSNull into nil, applies when JSON key is present but value is NULL
            if ([value isKindOfClass:[NSNull class]]) {
                value = nil;
            }

            [self setValue:value forKey:codingKey];
        }
    }
    
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    for (NSString *codingKey in [codingKeys keyEnumerator]) {
        
        NSString *key = [codingKeys objectForKey:codingKey];
        id value = [self valueForKey:codingKey];
        [dictionary setValue:value forKey:key];
    }
    
    return [dictionary copy];
}

@end
