//
//  EJSFavoriteArtist+NSJSONSerialization.m
//  FavoriteArtist
//
//  Created by Enzo Jimenez-Soto on 7/17/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

#import "EJSFavoriteArtist+NSJSONSerialization.h"

@implementation EJSFavoriteArtist (NSJSONSerialization)

/// Only used for decoding from JSON. Decodes from a dicitionary that has a key, which holds an array of dictionaries
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {

    NSArray *artistArray = dictionary[@"artists"];
    
    if (![artistArray isKindOfClass:[NSArray class]]) {
        NSLog(@"artistArray is not of class NSArray");
        return nil;
    }
    
    NSString *artist = artistArray[0][@"strArtist"];
    NSNumber *yearFormed = artistArray[0][@"intFormedYear"];
    NSString *biography = artistArray[0][@"strBiographyEN"];
    
    // Failable init
    if ([yearFormed isKindOfClass:[NSNull class]]) {
        yearFormed = nil;
        NSLog(@"yearFormed is null: %@", dictionary);
    }
    
    // these are required for valid object
    if (!artist || !biography) {
        NSLog(@"missing something in category");
        return nil;
    }
    
    self = [[EJSFavoriteArtist alloc] initWithartist:artist yearFormed:yearFormed.intValue biography:biography];
    
    return self;
}

/// Only used for loading from documents. Loads from an array of dictionaries
- (instancetype)initWithDict:(NSDictionary *)dict {
    
    NSString *artist = dict[@"strArtist"];
    NSNumber *yearFormed = dict[@"intFormedYear"];
    NSString *biography = dict[@"strBiographyEN"];
    
    self = [[EJSFavoriteArtist alloc] initWithartist:artist
                                          yearFormed:yearFormed.intValue
                                         biography:biography];
    
    return self;
}

/// For saving to Documents (turns favoriteArtist into a dictionary object)
- (NSDictionary *)toDictionary {
    
    NSDictionary *dictionary = @{
        @"strArtist": self.artist,
        @"intFormedYear": [NSNumber numberWithInt:self.yearFormed],
        @"strBiographyEN": self.biography
    };
 
    return dictionary;
}



@end
