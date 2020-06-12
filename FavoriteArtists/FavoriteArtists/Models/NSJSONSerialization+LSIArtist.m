//
//  NSJSONSerialization+LSIArtist.m
//  FavoriteArtists
//
//  Created by Bhawnish Kumar on 6/12/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

#import "NSJSONSerialization+LSIArtist.h"

@implementation LSIArtist (NSJSONSerialization)

- (NSDictionary *)withDictionary {
    
    NSDictionary *dictionary = @{@"strArtist": self.artist,
                                 @"strBiographyEN": self.biography,
                                 @"intFormedYear": [[NSNumber alloc] initWithInt:(int)self.yearFormed],
    };
    
    return dictionary;
}

@end
