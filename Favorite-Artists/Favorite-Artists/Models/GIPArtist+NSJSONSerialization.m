//
//  GIPArtist+NSJSONSerialization.m
//  Favorite-Artists
//
//  Created by Gi Pyo Kim on 12/13/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

#import "GIPArtist+NSJSONSerialization.h"
#import "GIPArtist.h"

@implementation GIPArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *name = dictionary[@"strArtist"];
    
    NSString *yearFormed = dictionary[@"intFormedYear"];
    int year = yearFormed.intValue;
    
    NSString *biography = dictionary[@"strBiographyEN"];
    
    return [[GIPArtist alloc] initWithName:name biography:biography yearFormed:year];
}

- (NSDictionary *)toDictionary {
    NSString *yearString = [NSString stringWithFormat:@"%d", (self.yearFormed)];
//    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys: self.name: @"strArtist", yearString: @"intFormedYear", self.biography: @"strBiographyEN", nil];
    
    return @{@"strArtist" : self.name, @"intFormedYear" : yearString, @"strBiographyEN": self.biography};
    
}

@end
