//
//  DBEArtist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Dahna on 7/17/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

#import "DBEArtist+NSJSONSerialization.h"
#import "DBEArtist.h"

@implementation DBEArtist (NSJSONSerialiazation)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = [dictionary objectForKey:@"strArtist"];
        self.biography = [dictionary objectForKey:@"strBiographyEN"];
        self.year = [[dictionary objectForKey:@"intFormedYear"] intValue];
    }
    return self;
}

- (NSDictionary *)toDictionary {
    NSMutableDictionary *artistDictionary = [NSMutableDictionary dictionary];
    
    [artistDictionary setObject:self.name forKey:@"strArtist"];
    
    [artistDictionary setObject:self.biography forKey:@"strBiographyEN"];
    
    NSString *yearString = @(self.year).stringValue;
    NSLog(@"Year Formed: %@", yearString);
    [artistDictionary setObject:yearString forKey:@"intFormedYear"];
    
    NSDictionary *returnedArtist = [NSDictionary dictionaryWithObjectsAndKeys:self.name,@"strArtist", self.biography, @"strBiographyEN", yearString, @"intFormedYear", nil];
    return returnedArtist;
}

@end
