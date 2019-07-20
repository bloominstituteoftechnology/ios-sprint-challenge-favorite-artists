//
//  SLRArtist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Sameera Roussi on 7/19/19.
//  Copyright © 2019 Sameera Roussi. All rights reserved.
//

#import "SLRArtist+NSJSONSerialization.h"

@implementation SLRArtist (NSJSONSerialization)

- (instancetype) initWithDictionary: (NSDictionary *)dictionary {
    if (self = [super init]) {
        self.artistName = [dictionary objectForKey:@"strArtist"];
        self.biography = [dictionary objectForKey:@"strBiographyEN"];
        self.yearFormed = [[dictionary objectForKey:@"intFormedYear"] intValue];
    }
    return self;
}


- (NSDictionary *) artistData {
    
    // Create mutable dictionary to hold various artist data that will be returned
    NSMutableDictionary *artistData = [NSMutableDictionary dictionary];
    
    // Cast yearFormed
    NSString *castYearFormed = @(self.yearFormed).stringValue;
    
    [artistData setObject:self.artistName forKey:@"strArtist"];
    [artistData setObject:self.biography forKey:@"strBiographyEN"];
    [artistData setObject:castYearFormed forKey:@"intFormedYear"];
   
    NSDictionary *artistDataDictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.artistName, @"strArtist", self.biography, @"strBiographyEN", castYearFormed, @"intFormedYear", nil];
    return artistDataDictionary;
}

@end
