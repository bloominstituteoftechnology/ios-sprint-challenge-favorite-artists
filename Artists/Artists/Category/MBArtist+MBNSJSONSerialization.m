//
//  MBArtist+MBNSJSONSerialization.m
//  Artists
//
//  Created by Mitchell Budge on 7/19/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import "MBArtist+MBNSJSONSerialization.h"

@implementation MBArtist (MBNSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.artist = [dictionary objectForKey:@"strArtist"];
        self.bio = [dictionary objectForKey:@"strBiographyEN"];
        self.year = [[dictionary objectForKey:@"intYear"] intValue];
    }
    return self;
}

- (NSDictionary *)artistDictionary {
    NSMutableDictionary *artistDictionary = [NSMutableDictionary dictionary];
    [artistDictionary setObject:self.artist forKey:@"strArtist"];
    [artistDictionary setObject:self.bio forKey:@"strBio"];
    NSString *yearFormedSteing = @(self.year).stringValue;
    [artistDictionary setObject:yearFormedSteing forKey:@"intYear"];
    NSDictionary *convertedDictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.artist, @"strArtist", self.bio, @"strBiographyEN", self.year, @"intFormedYear", nil];
    return convertedDictionary;
}

@end
