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
    
    NSString *artist = artistArray[0][@"artist"];
    NSNumber *yearFormed = artistArray[0][@"yearFormed"];
    NSString *biography = artistArray[0][@"biography"];
    
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
    NSNumber *yearFormed = dict[@"yearFormed"];
    NSString *biography = dict[@"biography"];
    
    self = [[EJSFavoriteArtist alloc] initWithartist:artist
                                          yearFormed:yearFormed.intValue
                                         biography:biography];
    
    return self;
}

/// For saving to Documents (turns favoriteArtist into a dictionary object)
- (NSDictionary *)toDictionary {
    
    NSDictionary *dictionary = @{
        @"artist": self.artist,
        @"yearFormed": [NSNumber numberWithInt:self.yearFormed],
        @"biography": self.biography
    };
 
    return dictionary;
}



@end
