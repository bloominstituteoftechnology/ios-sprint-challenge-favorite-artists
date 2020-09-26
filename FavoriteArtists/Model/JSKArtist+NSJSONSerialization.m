//
//  JSKArtist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Josh Kocsis on 9/25/20.
//

#import "JSKArtist+NSJSONSerialization.h"

@implementation JSKArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{

    NSString *artistName = dictionary[@"strArtist"];
    NSString *artistBio = dictionary[@"strBiographyEN"];
    NSNumber *yearFormed = dictionary[@"intFormedYear"];
    int yearFormedNSNumber = [yearFormed intValue];

    return [self initWithArtistName:artistName artistBio:artistBio yearFormed:yearFormedNSNumber];
}

- (NSDictionary *)toDictionary
{

    return @{
        @"strArtist": self.artistName,
        @"strBiographyEN": self.artistBio,
        @"intFormedYear": self.yearFormed
    };

}

@end
