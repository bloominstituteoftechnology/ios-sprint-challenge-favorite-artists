//
//  JDKArtist+NSJSONSerialization.m
//  FavoriteArtist
//
//  Created by John Kouris on 2/8/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

#import "JDKArtist+NSJSONSerialization.h"
#import "JDKArtist.h"

@implementation JDKArtist (JDKNSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        self.name = [dictionary objectForKey:@"strArtist"];
        self.biography = [dictionary objectForKey:@"strBiographyEN"];
        self.yearFormed = [[dictionary objectForKey:@"intFormedYear"] intValue];
    }
    return self;
}

- (NSDictionary *)toDictionary
{
    NSMutableDictionary *artistDictionary = [NSMutableDictionary dictionary];
    [artistDictionary setObject:self.name forKey:@"strArtist"];
    [artistDictionary setObject:self.biography forKey:@"strBiographyEN"];
    
    NSString *yearFormedString = @(self.yearFormed).stringValue;
    [artistDictionary setObject:yearFormedString forKey:@"intFormedYear"];
    
    NSDictionary *finalArtistDictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.name, @"strArtist", self.biography, @"strBiographyEN", yearFormedString, @"intFormedYear", nil];
    
    return finalArtistDictionary;
}

@end
