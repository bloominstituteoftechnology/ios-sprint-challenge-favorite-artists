//
//  NSJSONSerialization+KMLArtist_.m
//  FavoriteArtists
//
//  Created by Keri Levesque on 4/17/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

#import "NSJSONSerialization+KMLArtist_.h"


@implementation KMLArtist (NSJSONSerialization)


- (instancetype)initWithDictionary:(NSDictionary *)dictionary {

    NSString *name = dictionary[@"strArtist"];
    NSString *strFormedYear = dictionary[@"intFormedYear"];
    int formedYear = 0;
    if ([strFormedYear isKindOfClass:[NSString class]]) {
       formedYear = [strFormedYear intValue];
    }
    NSString *biography = dictionary[@"strBiographyEN"];

    return [self initWithName:name biography:biography formedYear:formedYear];

}

- (NSDictionary *)toDictionary {

    NSDictionary *artistDictionary = @{
        @"strArtist" : self.name,
        @"intFormedYear" : [self formedYearString],
        @"strBiographyEN" : self.biography
    };

    return artistDictionary;
}

@end
