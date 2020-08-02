//
//  CLPArtist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Chad Parker on 7/31/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

#import "CLPArtist+NSJSONSerialization.h"

@implementation CLPArtist (NSJSONSerialization)

- (NSDictionary *)toDictionary
{
    NSDictionary *dictionary = @{
        @"strArtist": self.name,
        @"intFormedYear": [NSNumber numberWithInt:self.yearFormed],
        @"strBiographyEN": self.biography,
    };
    return dictionary;
}

@end
