//
//  VDRArtist+NSJSONSerialization.m
//  FavArtists
//
//  Created by Victor  on 7/19/19.
//  Copyright © 2019 Victor . All rights reserved.
//

#import "VDRArtist+NSJSONSerialization.h"
#import "VDRArtist.h"

@implementation VDRArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = [dictionary objectForKey:@"strArtist"];
        self.biography = [dictionary objectForKey:@"strBiographyEN"];
        self.yearFormed = [[dictionary objectForKey:@"intFormedYear"] intValue];
    }
    return self;
}


- (NSDictionary *)createArtistDictionary {
    
    NSMutableDictionary *artistDictionary = [NSMutableDictionary dictionary];
    [artistDictionary setObject:self.name forKey:@"strArtist"];
    [artistDictionary setObject:self.biography forKey:@"strBiographyEN"];
    
    NSString *yearFormedString = @(self.yearFormed).stringValue;
    [artistDictionary setObject:yearFormedString forKey:@"intFormedYear"];
    
    NSDictionary *artistDict = [NSDictionary dictionaryWithObjectsAndKeys:self.name, @"strArtist", self.biography, @"strBiographyEN", yearFormedString, @"intFormedYear", nil];
    return artistDict;
    
}
@end
