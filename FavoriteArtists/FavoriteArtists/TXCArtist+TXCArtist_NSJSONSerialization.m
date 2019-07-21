//
//  TXCArtist+TXCArtist_NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Thomas Cacciatore on 7/19/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

#import "TXCArtist+TXCArtist_NSJSONSerialization.h"

@implementation TXCArtist (TXCArtist_NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        
        NSString *artistName = dictionary[@"strArtist"];
        NSString *artistBiography = dictionary[@"strBiographyEN"];
        int artistDateFormed = [dictionary[@"intFormedYear"] intValue];
        
        if (artistName != nil && artistBiography && artistDateFormed) {
            self = [self initWithName:artistName biography:artistBiography dateFormed:artistDateFormed];
        } else {
            NSLog(@"Invalid artist: %@ JSON object", artistName);
            self = nil;
        }
    }
    return self;
}

- (NSDictionary *)toDictionary {
    // Convert model object into a dictionary which we will turn into data to save to persistent store.
    NSString *dateAsString = [NSString stringWithFormat:@"%d", self.dateFormed];
    NSDictionary *objectAsDict = @{@"name": self.name, @"biography": self.biography, @"dateFormed": dateAsString};
    return objectAsDict;
}


@end
