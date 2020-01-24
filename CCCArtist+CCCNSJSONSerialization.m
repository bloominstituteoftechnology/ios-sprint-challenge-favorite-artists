//
//  CCCArtist+CCCNSJSONSerialization.m
//  ios-sprint-challenge-favorite-artists
//
//  Created by Jonalynn Masters on 1/24/20.
//  Copyright © 2020 Jonalynn Masters. All rights reserved.
//

#import "CCCArtist+CCCNSJSONSerialization.h"
#import "CCCArtist.h"

@implementation CCCArtist (CCCNSJSONSerialization)

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
    
    //NSLog(@"name: %@, year: %d, bio: %@", self.name, self.yearFormed, self.biography);
    
    
    NSDictionary *artistDict = [NSDictionary dictionaryWithObjectsAndKeys:self.name, @"strArtist", self.biography, @"strBiographyEN", yearFormedString, @"intFormedYear", nil];
    return artistDict;
    
}
@end
