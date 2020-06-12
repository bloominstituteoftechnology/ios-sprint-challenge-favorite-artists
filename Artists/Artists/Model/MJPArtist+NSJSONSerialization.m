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
        self.strArtist = [dictionary objectForKey:@"strArtist"];
        self.strBiographyEN = [dictionary objectForKey:@"strBiographyEN"];

        NSString *yearNum = dictionary[@"intFormedYear"];
        if ([yearNum isKindOfClass:[NSNull class]]) {
             self.yearFormed = 0;
        } else {
            self.yearFormed = [[dictionary objectForKey:@"intFormedYear"] intValue];
        }
    }
    return self;
}

- (NSDictionary *)toDictionary {
    NSMutableDictionary *artistDictionary = [NSMutableDictionary dictionary];
    [artistDictionary setObject:self.strArtist forKey:@"strArtist"];
    [artistDictionary setObject:self.strBiographyEN forKey:@"strBio"];
    NSString *yearFormedString = @(self.yearFormed).stringValue;
    [artistDictionary setObject:yearFormedString forKey:@"intFormedYear"];
    NSDictionary *convertedDictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.strArtist, @"strArtist", self.strBiographyEN, @"strBiographyEN", self.yearFormed, @"intFormedYear", nil];
    return convertedDictionary;
}


@end
