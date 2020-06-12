//
//  SDJArtist+JSONSerialization.m
//  FavoriteArtists
//
//  Created by Shawn James on 6/12/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

#import "SDJArtist+JSONSerialization.h"

@implementation SDJArtist (NSJSONSerialization)

- (NSDictionary *)toDictionary {
    NSDictionary *dictionary = @{@"strArtist": self.artistName,
                                 @"intFormedYear": [[NSNumber alloc] initWithInt:self.yearFormed],
                                 @"strBiographyEN": self.artistBiography
    };
    return dictionary;
}

@end
