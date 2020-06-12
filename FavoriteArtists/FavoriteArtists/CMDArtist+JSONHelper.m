//
//  CMDArtist+JSONHelper.m
//  FavoriteArtists
//
//  Created by Chris Dobek on 6/12/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

#import "CMDArtist+JSONHelper.h"
#import "CMDArtist.h"

@implementation CMDArtist (JSONHelper)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary{
    NSString *name = dictionary[@"strArtist"];
    NSString *yearStr = dictionary[@"intFormedYear"];
    NSString *biography = dictionary[@"strBiographyEN"];
    
    if ([yearStr isKindOfClass:[NSString class]] || [yearStr isKindOfClass:[NSNumber class]]) {
        int year = [yearStr intValue];
        return [self initWithName:name year:year biography:biography];
    } else {
        int year = 0;
        return [self initWithName:name year:year biography:biography];
    }
}

- (NSDictionary *)toDictionary {
    NSNumber *yearNum = [NSNumber numberWithInt:self.year];
    NSDictionary *dictionary = @{
        @"strArtist": self.name,
        @"intFormedYear": yearNum,
        @"strBiographyEN": self.biography
    };
    return dictionary;
}

@end
