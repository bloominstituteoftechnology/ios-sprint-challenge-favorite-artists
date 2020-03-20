//
//  JLAFavoriteArtist+NSJSONSerialization.m
//  FavoriteArtistsSprint
//
//  Created by Jorge Alvarez on 3/20/20.
//  Copyright © 2020 Jorge Alvarez. All rights reserved.
//

#import "JLAFavoriteArtist+NSJSONSerialization.h"

@implementation JLAFavoriteArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    NSString *strArtist = dictionary[@"strArtist"];
    NSNumber *intFormedYear = dictionary[@"intFormedYear"];
    NSString *strBiographyEN = dictionary[@"strBiographyEN"];
    
    JLAFavoriteArtist *favoriteArtist = [[JLAFavoriteArtist alloc] initWithStrArtist:strArtist
                                                               intFormedYear:intFormedYear.intValue
                                                              strBiographyEN:strBiographyEN];
    
    
    return favoriteArtist;
}

// TODO: For saving to Documents
//- (NSDictionary *)toDictionary {
//
//}

@end
