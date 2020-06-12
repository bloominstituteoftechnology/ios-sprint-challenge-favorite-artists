//
//  PDMArtist+JSONSerialization.m
//  FavoriteArtists
//
//  Created by Patrick Millet on 6/12/20.
//  Copyright © 2020 PatrickMillet79. All rights reserved.
//

#import "PDMArtist+JSONSerialization.h"

@implementation  PDMArtist (NSJSONSerialization)

static NSString const *nameKey = @"strArtist";
static NSString const *biographyKey = @"strBiographyEN";
static NSString const *yearFormedKey = @"intFormedYear";

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *name = dictionary[nameKey];
    NSString *biography = dictionary[biographyKey];
    NSNumber *yearFormed = dictionary[yearFormedKey];
    
    NSInteger year;
    if (![yearFormed isEqual:[NSNull null]]) {
        year = [yearFormed integerValue];
    } else {
        NSLog(@"Missing year for %@", name);
        year = PDM_Artist_UnknownYear;
    }
    
    return [self initWithName:name biography: biography yearFormed:year];
}

- (NSDictionary *)toDictionary
{
    return @{
        nameKey: self.name,
        biographyKey: self.biography,
        yearFormedKey: @(self.yearFormed)
    };
}


@end
