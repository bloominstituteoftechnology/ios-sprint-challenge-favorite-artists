//
//  LSIArtist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Alex Thompson on 5/30/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSIArtist+NSJSONSerialization.h"

@implementation LSIArtists (NSJSONSerialization)

- (NSDictionary *)toDictionary {
    
    NSDictionary *dictionary = @{@"strArtist": self.artist,
                                 @"intFormedYear": [[NSNumber alloc] initWithInt:self.yearFormed],
                                 @"strBiographyEN": self.biography
    };
    
    return dictionary;
}

@end
