//
//  WAHArtist+NSJSONSerialization.m
//  Favorite Artists
//
//  Created by Wyatt Harrell on 5/15/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

#import "WAHArtist+NSJSONSerialization.h"

@implementation WAHArtist (NSJSONSerialization)

- (NSDictionary *)toDictionary {
    
    NSDictionary *dictionary = @{@"strArtist": self.artist,
                                 @"intFormedYear": [[NSNumber alloc] initWithInt:(int)self.yearFormed],
                                 @"strBiographyEN": self.biography
    };
    
    return dictionary;
}

@end
