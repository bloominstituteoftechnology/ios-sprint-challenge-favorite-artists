//
//  Artist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Elizabeth Thomas on 9/27/20.
//

#import "Artist+NSJSONSerialization.h"

@implementation Artist (NSJSONSerialization)

- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *artistName = [dictionary objectForKey:@"strArtist"];
    if (![artistName isKindOfClass:NSString.class]) return nil;

    NSNumber *yearFormed = [dictionary objectForKey:@"intFormedYear"];
    if ([yearFormed isKindOfClass:NSNull.class]) {
        yearFormed = nil;
    } else if ([yearFormed isKindOfClass:NSString.class]) {
        NSString *yearFormedString = [dictionary objectForKey:@"intFormedYear"];
        yearFormed = @(yearFormedString.intValue);
    } else if (![yearFormed isKindOfClass:NSNumber.class]) return nil;

    NSString *biography = [dictionary objectForKey:@"strBiographyEN"];
    if ([biography isKindOfClass:NSNull.class]) {
        biography = nil;
    } else if (![biography isKindOfClass:NSString.class]) return nil;

    return [self initWithArtistName:artistName
                         yearFormed:yearFormed.intValue
                          biography:biography];

}

- (NSDictionary *)toDictionary
{
    NSNumber *yearFormed = [NSNumber numberWithInt:self.yearFormed];

    return @{ @"strArtist": self.name,
              @"intFormedYear": yearFormed,
              @"strBiographyEN": self.biography };
}

@end
