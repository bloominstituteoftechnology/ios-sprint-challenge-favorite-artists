//
//  LSIArtist+NSJSONSerialization_.m
//  Favorite Artists
//
//  Created by Kelson Hartle on 7/20/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

#import "LSIArtist+NSJSONSerialization_.h"

@implementation LSIArtist (NSJSONSerialization_)


- (NSDictionary *)toDictionary; {
    
    NSDictionary *dictionary = @{@"strArtist": self.artistName,
                                 @"intFormedYear": [[NSNumber alloc] initWithInt:(int)self.yearFormed],
                                 @"strBiographyEN": self.biography
    };
    
    return dictionary;
}

@end
