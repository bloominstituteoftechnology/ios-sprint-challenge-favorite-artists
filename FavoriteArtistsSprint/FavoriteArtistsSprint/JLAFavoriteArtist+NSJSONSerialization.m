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
    
    NSArray *artistArray = dictionary[@"artists"];
    
    //NSString *strArtist = dictionary[@"strArtist"];
    NSString *strArtist = artistArray[0][@"strArtist"];
    NSNumber *intFormedYear = artistArray[0][@"intFormedYear"];
    NSString *strBiographyEN = artistArray[0][@"strBiographyEN"];
    
//    JLAFavoriteArtist *favoriteArtist = [[JLAFavoriteArtist alloc] initWithStrArtist:strArtist
//                                                               intFormedYear:intFormedYear.intValue
//                                                              strBiographyEN:strBiographyEN];
    NSLog(@"Category initWithDictionary");
    NSLog(@"name: %@", strArtist);
    NSLog(@"year: %i", intFormedYear.intValue);
    NSLog(@"bio: %@", strBiographyEN);
    self = [self initWithStrArtist:strArtist intFormedYear:intFormedYear.intValue strBiographyEN:strBiographyEN];
    
    return self;
}

// TODO: For saving to Documents
//- (NSDictionary *)toDictionary {
//
//}

@end
