//
//  MJSArtist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Morgan Smith on 9/27/20.
//

#import "MJSArtist+NSJSONSerialization.h"

@implementation MJSArtist (NSJSONSerialization)

- (NSDictionary *)toDictionary {

    NSDictionary *dictionary = @{@"strArtist": self.artist,
                                 @"intFormedYear": [[NSNumber alloc] initWithInt:self.yearFormed],
                                 @"strBiographyEN": self.biography
    };

    return dictionary;
}

@end
