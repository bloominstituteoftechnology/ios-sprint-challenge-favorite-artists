//
//  MJPArtist+NSJSONSerialization.m
//  Artists
//
//  Created by Mark Poggi on 6/12/20.
//  Copyright © 2020 Mark Poggi. All rights reserved.
//

#import "MJPArtist+NSJSONSerialization.h"

@implementation MJPArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.strArtist = dictionary[@"strArtist"];
        self.strBiographyEN = dictionary[@"strBiographyEN"];

        NSString *yearNum = dictionary[@"intFormedYear"];
        if ([yearNum isKindOfClass:[NSNull class]]) {
             self.yearFormed = 0;
        } else {
            self.yearFormed = [dictionary[@"intFormedYear"] intValue];
        }
    }
    return self;
}

- (NSDictionary *)toDictionary {
    NSNumber *yearNum = [NSNumber numberWithInt:self.yearFormed];
    NSDictionary *dictionary = @{
        @"strArtist" : self.strArtist,
        @"intFormedYear" : yearNum,
        @"strBiographyEN" : self.strBiographyEN
    };
    return dictionary;
}



@end
