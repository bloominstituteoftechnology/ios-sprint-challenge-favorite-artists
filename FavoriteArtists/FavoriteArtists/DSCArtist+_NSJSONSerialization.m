//
//  DSCArtist+_NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by denis cedeno on 5/30/20.
//  Copyright © 2020 DenCedeno Co. All rights reserved.
//

#import "DSCArtist+_NSJSONSerialization.h"

@implementation DSCArtist (_NSJSONSerialization)


- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    
    NSString *name = dictionary[@"strArtist"];
    NSString *biography = dictionary[@"strBiographyEN"];
    NSString *yearInt = dictionary[@"intFormedYear"];
    
    if ([yearInt isKindOfClass:[NSString class]] || [yearInt isKindOfClass:[NSNumber class]]) {
        int year = [yearInt intValue];
        return [self initWithName:name biography:biography year:year];
    } else {
        int year = 0;
        return [self initWithName:name biography:biography year:year];
    }
}

- (NSDictionary *)toDictionary
{
    NSNumber *yearInt = [NSNumber numberWithInt:self.year];
    NSDictionary *dictionary = @{
        @"strArtist" : self.name,
        @"strBiographyEN" : self.biography,
        @"intFormedYear" : yearInt
    };
    return dictionary;
}


@end
