//
//  OTKArtist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Tobi Kuyoro on 15/05/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

#import "OTKArtist+NSJSONSerialization.h"
#import "OTKArtist.h"

@implementation OTKArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *name = dictionary[@"strArtist"];
    NSString *bio = dictionary[@"strBiographyEN"];
    NSString *yearFormed = dictionary[@"intFormedYear"];

    self = [self initWithName:name
                          bio:bio
                   yearFormed:yearFormed.intValue];

    return self;
}

- (NSDictionary *)toDictionary {
    return @{
        @"strArtist": self.name,
        @"strBiographyEN": self.bio,
        @"intFormedYear": [[NSNumber alloc] initWithInt:self.yearFormed]
    };
}

@end
