//
//  MyArtist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Gladymir Philippe on 11/22/20.
//

#import "MyArtist+NSJSONSerialization.h"

@implementation MyArtist (NSJSONSerialization)

- (NSDictionary *)toDictionary {
    
    NSDictionary *dictionary = @{@"strArtist": self.artist,
                                 @"intFormedYear": [[NSNumber alloc] initWithInt:self.yearFormed],
                                 @"strBiographyEN": self.biography
    };
    return dictionary;
}

@end
