//
//  HSIArtist+NSJSONSerialization.m
//  Favorite Artists
//
//  Created by Kenny on 6/12/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

#import "HSIArtist+NSJSONSerialization.h"

@implementation HSIArtist (NSJSONSerialization)

static NSString *artistNameKey = @"strArtist";
static NSString *artistBiographyKey = @"strBiographyEN";
static NSString *artistYearKey = @"intFormedYear";

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (dictionary) {
        NSString *name = dictionary[artistNameKey];
        NSString *biography = dictionary[artistBiographyKey];
        NSNumber *year = dictionary[artistYearKey];
        if (name && biography && year) {
            return [self initWithName:name biography:biography year:year.intValue];
        }
    }
    return nil;
}

- (NSDictionary *)toDictionary {
    return @{
        artistNameKey: self.name,
        artistBiographyKey: self.biography,
        artistYearKey: @(self.year)
    };
}

@end
