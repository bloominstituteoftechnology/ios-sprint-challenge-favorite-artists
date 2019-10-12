//
//  MJRArtist+MJRNSJSONSerialization.m
//  FavoriteArtists-ObjC
//
//  Created by Marlon Raskin on 10/11/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

#import "MJRArtist+MJRNSJSONSerialization.h"


@implementation MJRArtist (MJRNSJSONSerialization)

- (instancetype) initWithDictionary: (NSDictionary *)dictionary {
    if (self = [super init]) {
        NSString *artistName = [dictionary objectForKey:@"strArtist"];

        NSString *bio = [dictionary[@"strBiographyEN"] length] > 0 ? [dictionary objectForKey:@"strBiographyEN"] : [NSString stringWithFormat:@"No additional information about %@ in AudioDB", artistName];

        int yearFormed = (dictionary[@"intFormedYear"] == (id)[NSNull null] ) ? 0 :  [[dictionary objectForKey:@"intFormedYear"] intValue];

        self = [self initWithArtistName:artistName bio:bio yearFormed:yearFormed];
    }
    return self;
}

- (NSDictionary *) artistData {
    NSMutableDictionary *artistData = [NSMutableDictionary dictionary];
    NSString *castYearFormed = @(self.yearFormed).stringValue;

    [artistData setObject:self.artistName forKey:@"strArtist"];
    [artistData setObject:self.bio forKey:@"strBiographyEN"];
    [artistData setObject:castYearFormed forKey:@"intFormedYear"];

    NSDictionary *artistDataDictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.artistName, @"strArtist", self.bio, @"strBiographyEN", castYearFormed, @"intFormedYear", nil];
    return artistDataDictionary;
}

- (NSString *)formedInYearDesc {
    return [NSString stringWithFormat:@"Formed in %d", self.yearFormed];
}

@end
