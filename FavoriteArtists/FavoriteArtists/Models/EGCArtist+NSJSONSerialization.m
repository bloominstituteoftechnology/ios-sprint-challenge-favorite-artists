//
//  EGCArtist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Enrique Gongora on 4/17/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

#import "EGCArtist.h"
#import "EGCArtist+NSJSONSerialization.h"

@implementation EGCArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *name = dictionary[@"strArtist"];
    NSString *about = dictionary[@"strBiographyEN"];
    NSLog(@"%@", dictionary[@"intFormedYear"]);
    NSString *yearNum = dictionary[@"intFormedYear"];//yearInt;
    if ([yearNum isKindOfClass:[NSString class]] || [yearNum isKindOfClass:[NSNumber class]]) {
        NSLog(@"%@", yearNum);
        int year = [yearNum intValue];
        return [self initWithName: name year:year about:about];
    } else {
        int year = 0;
        return [self initWithName: name year:year about:about];
    }
}

- (NSDictionary *)toDictionary {
    NSNumber *yearNum = [NSNumber numberWithInt:self.year];
    NSDictionary *dictionary = @{
        @"strArtist" : self.name,
        @"intFormedYear" : yearNum,
        @"strBiographyEN" : self.about
    };
    return dictionary;
}

@end
