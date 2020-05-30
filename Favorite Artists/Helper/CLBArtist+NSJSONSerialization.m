//
//  CLBArtist+NSJSONSerialization.m
//  Favorite Artists
//
//  Created by Christian Lorenzo on 5/30/20.
//  Copyright © 2020 Christian Lorenzo. All rights reserved.
//

#import "CLBArtist+NSJSONSerialization.h"

@implementation CLBArtists (NSJSONSerialization)

- (NSDictionary *)toDictionary {
    
    NSDictionary *dictionary = @{@"strArtist": self.artist,
                                 @"intFormedYear": [[NSNumber alloc] initWithInt:self.yearFormed],
                                 @"strBiographyEN": self.biography
    };
    
    return dictionary;
}

@end
