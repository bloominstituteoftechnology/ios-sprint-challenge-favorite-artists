//
//  LSINSObject+JSONSerialization.m
//  FavoriteArtists
//
//  Created by Alex on 7/19/19.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "LSINSObject+JSONSerialization.h"

@implementation LSIArtist (JSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = [dictionary objectForKey:@"strArtist"];
        self.bio = [dictionary objectForKey:@"strBiographyEN"];
        self.formed = [[dictionary objectForKey:@"intFormedYear"] intValue];
    }
    return self;
}

- (NSDictionary *)artistDict {
    NSMutableDictionary *artistDict = [NSMutableDictionary dictionary];
    
    // pull values
    [artistDict setObject:self.name forKey:@"strArtist"];
    [artistDict setObject:self.bio forKey:@"strBio"];
    [artistDict setObject:@"1990" forKey:@"intFormedYear"];
    
    NSDictionary *convertedDictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.name, @"strArtist", self.bio, @"strBiographyEN", self.formed, @"intFormedYear", nil];
    return convertedDictionary;
}

@end
