//
//  Artist+JSONSerialization.m
//  FavoriteArtists
//
//  Created by Clayton Watkins on 9/25/20.
//

#import "Artist+JSONSerialization.h"

@implementation Artist (JSONSerialization)

- (nullable instancetype) initWithDictionary:(NSDictionary *)dictionary
{
    NSString *artistName = [dictionary objectForKey:@"strArtist"];
    if (![artistName isKindOfClass:NSString.class]) return nil;
    
    NSNumber *yearFormed = [dictionary objectForKey:@"intFormedYear"];
    if ([yearFormed isKindOfClass:[NSNull class]]) {
        yearFormed = nil;
    } else if ([yearFormed isKindOfClass:[NSString class]]) {
        NSString *yearFormedString = [dictionary objectForKey:@"intFormedYear"];
        yearFormed = @([yearFormedString intValue]);
    } else if (![yearFormed isKindOfClass:[NSNumber class]]) return nil;
    
    NSString *artistBio = [dictionary objectForKey:@"strBiographyEN"];
    if ([artistBio isKindOfClass:[NSNull class]]){
        artistBio = nil;
    } else if (![artistBio isKindOfClass:NSString.class]) return nil;
    
    return [self initWithArtistName:artistName
                          artistBio:artistBio
                         yearFormed:yearFormed];
}

- (NSDictionary *)toDictionary
{
    NSNumber *yearFormed = [NSNumber numberWithInt:self.yearFormed];
    
    return@{ @"strArtist": self.artistName,
        @"intFormedYear": yearFormed,
        @"strBiographyEN": self.artistBio
    };
}


@end
