//
//  Artist+Artist_NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Joel Groomer on 2/8/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

#import "Artist+Artist_NSJSONSerialization.h"

@implementation Artist (Artist_NSJSONSerialization)

+ (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    Artist *artist = [[Artist alloc] init];
    artist.name = [dictionary objectForKey:@"strArtist"];
    NSString *yearString;
    
    if ([[dictionary objectForKey:@"intFormedYear"] isKindOfClass:[NSString class]]) {
        yearString = [dictionary objectForKey:@"intFormedYear"];
    } else {
        yearString = @"0";
    }
    
    artist.yearFormed = [yearString intValue];
    artist.bio = [dictionary objectForKey:@"strBiographyEN"];
    return artist;
}

- (NSDictionary *)toDictionary
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setObject:self.name forKey:@"strArtist"];
    [dictionary setObject:[NSString stringWithFormat:(@"%d"), self.yearFormed] forKey:@"intFormedYear"];
    [dictionary setObject:self.name forKey:@"strBiographyEN"];
    return dictionary.copy;
}

@end
