//
//  DLJJSONSerialization.m
//  FavoriteArtistApp
//
//  Created by Diante Lewis-Jolley on 7/19/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

#import "DLJJSONSerialization.h"

@implementation DLJArtist (NSJSONSerialization)

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];

    if (self) {
        self.name = [dictionary objectForKey:@"strArtist"];
        self.bio = [dictionary objectForKey:@"strBiographyEN"];
        self.yearFormed = [[dictionary objectForKey:@"intFormedYear"] intValue];
    }

    return self;
}

-(NSDictionary *)artistDictionary {
    NSMutableDictionary *artistDictionary = [NSMutableDictionary dictionary];
    [artistDictionary setObject:self.name forKey:@"strArtist"];
    [artistDictionary setObject:self.bio forKey:@"strBiographyEN"];

    NSString *yearFormedString = @(self.yearFormed).stringValue;
    [artistDictionary setObject:yearFormedString forKey:@"intFormedYear"];


    NSDictionary *artistDict = [NSDictionary dictionaryWithObjectsAndKeys:self.name, @"strArtist", self.bio, @"strBiographyEN", yearFormedString, @"intFormedYear", nil];
    return artistDict;
}

@end
