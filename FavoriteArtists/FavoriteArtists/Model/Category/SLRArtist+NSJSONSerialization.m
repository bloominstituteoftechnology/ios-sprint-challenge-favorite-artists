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
        // Decode the artistName
        NSString *artistName = [dictionary objectForKey:@"strArtist"];
        
        // We have an artist, but we may not have a biography or yearFormed
        NSString *biography = [dictionary[@"strBiographyEN"] length] > 0 ? [dictionary objectForKey:@"strBiographyEN"] : [NSString stringWithFormat:@"No additional information about %@ in AudioDB", artistName];
        int yearFormed = (dictionary[@"intFormedYear"] == (id)[NSNull null] ) ? 0 :  [[dictionary objectForKey:@"intFormedYear"] intValue];
    
        self = [self initWithArtistName:artistName biography:biography yearFormed:yearFormed];
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
