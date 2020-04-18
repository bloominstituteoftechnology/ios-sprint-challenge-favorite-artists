//
//  UFOArtist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Ufuk Türközü on 17.04.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

#import "UFOArtist+NSJSONSerialization.h"
#import "UFOAPIController.h"
#import "UFOArtist.h"

@implementation UFOArtist (NSJSONSerialization)

static NSString const *nameKey = @"strArtist";
static NSString const *biographyKey = @"strBiographyEN";
static NSString const *yearFormedKey =  @"intFormedYear";

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    NSString *name = dictionary[nameKey];
    NSNumber *yearFormed = dictionary[yearFormedKey];
    NSString *biography = dictionary[biographyKey];
    
    return [self initWithName:name
            yearFormed:yearFormed.intValue
                    biography:biography];
}

- (NSDictionary *)toDictionary {
    return @{
        nameKey: self.name,
        biographyKey: self.biography,
        yearFormedKey: @(self.yearFormed)
    };
}

@end
