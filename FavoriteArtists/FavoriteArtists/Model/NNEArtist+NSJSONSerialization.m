//
//  NNEArtist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Nonye on 7/17/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

#import "NNEArtist.h"
#import "NNEArtist+NSJSONSerialization.h"


@implementation NNEArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *name = dictionary[@"strArtist"];
    NSString *artistBio = dictionary[@"strBiographyEn"];
    NSString *yearFormed = dictionary[@"intYearFormed"];
    
    self = [self initWithName:name bio:artistBio yearFormed:yearFormed.intValue];
    return self;
}

- (NSDictionary *)toDictionary {
    return @{
        @"strArtist": self.name,
        @"strBiographyEN": self.artistBio,
        @"intFormedYear": [[NSNumber alloc] initWithInt:self.yearFormed]
    };
}
@end

