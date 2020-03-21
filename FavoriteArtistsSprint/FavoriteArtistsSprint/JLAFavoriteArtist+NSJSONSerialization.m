//
//  JLAFavoriteArtist+NSJSONSerialization.m
//  FavoriteArtistsSprint
//
//  Created by Jorge Alvarez on 3/20/20.
//  Copyright © 2020 Jorge Alvarez. All rights reserved.
//

#import "JLAFavoriteArtist+NSJSONSerialization.h"

@implementation JLAFavoriteArtist (NSJSONSerialization)

/// Only used for decoding from JSON. Decodes from a dicitionary that has a key, which holds an array of dictionaries
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {

    NSArray *artistArray = dictionary[@"artists"];
    
    if (![artistArray isKindOfClass:[NSArray class]]) {
        NSLog(@"artistArray is not of class NSArray");
        return nil;
    }
    
    NSString *strArtist = artistArray[0][@"strArtist"];
    NSNumber *intFormedYear = artistArray[0][@"intFormedYear"];
    NSString *strBiographyEN = artistArray[0][@"strBiographyEN"];
    
    // Failable init
    if ([intFormedYear isKindOfClass:[NSNull class]]) {
        intFormedYear = nil;
        NSLog(@"intFormedYear is null: %@", dictionary);
    }
    
    // these are required for valid object
    if (!strArtist || !strBiographyEN) {
        NSLog(@"missing something in category");
        return nil;
    }
    
    self = [[JLAFavoriteArtist alloc] initWithStrArtist:strArtist intFormedYear:intFormedYear.intValue strBiographyEN:strBiographyEN];
    
    return self;
}

/// Only used for loading from documents. Loads from an array of dictionaries
- (instancetype)initWithDict:(NSDictionary *)dict {
    
    NSString *strArtist = dict[@"strArtist"];
    NSNumber *intFormedYear = dict[@"intFormedYear"];
    NSString *strBiographyEN = dict[@"strBiographyEN"];
    
    self = [[JLAFavoriteArtist alloc] initWithStrArtist:strArtist
                                          intFormedYear:intFormedYear.intValue
                                         strBiographyEN:strBiographyEN];
    
    return self;
}

/// For saving to Documents (turns favoriteArtist into a dictionary object)
- (NSDictionary *)toDictionary {
    
    NSDictionary *dictionary = @{
        @"strArtist": self.strArtist,
        @"intFormedYear": [NSNumber numberWithInt:self.intFormedYear],
        @"strBiographyEN": self.strBiographyEN
    };
    // strBiographyEN used to just say strBiography, bug
    return dictionary;
}

@end
