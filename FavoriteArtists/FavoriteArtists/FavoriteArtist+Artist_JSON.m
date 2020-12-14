//
//  FavoriteArtist+Artist_JSON.m
//  FavoriteArtists
//
//  Created by Craig Belinfante on 12/13/20.
//

#import "FavoriteArtist+Artist_JSON.h"

@implementation FavoriteArtist (Artist_JSON)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if(self) {
        NSString *artist = dictionary[@"strArtist"];
        NSString *biography = dictionary[@"strBiographyEN"];
        int year = (int)[dictionary[@"intFormedYear"] integerValue];
        self = [self initWithArtist:artist
                          biography:biography
                               year:year];
    }
    return self;
}

- (NSDictionary *)toDictionary {
    NSString *formedYear = [[NSString alloc] initWithFormat:@"%i", self.year];
    return @{@"strArtist": self.artist,
             @"strBiographyEN": self.biography,
             @"intFormedYear": formedYear};
}

@end
