//
//  JSKArtist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Josh Kocsis on 9/25/20.
//

#import "JSKArtist+NSJSONSerialization.h"

@implementation JSKArtist (NSJSONSerialization)

- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary
{

    NSString *artistName = [dictionary objectForKey:@"strArtist"];

    NSString *artistBio = [dictionary objectForKey:@"strBiographyEN"];

    NSNumber *yearFormed = [dictionary objectForKey:@"intFormedYear"];
    if ([yearFormed isKindOfClass:NSNull.class]) {
        yearFormed = nil;
    } else if ([yearFormed isKindOfClass:NSString.class]) {
    NSString *yearFormedString = [dictionary objectForKey:@"inFormedYear"];
        yearFormed = @([yearFormedString intValue]);
    } else if (![yearFormed isKindOfClass:NSNumber.class]) {
        return nil;
    }
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
