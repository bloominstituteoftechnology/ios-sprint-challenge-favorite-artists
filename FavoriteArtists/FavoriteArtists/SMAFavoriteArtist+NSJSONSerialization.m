//
//  SMAFavoriteArtist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Sean Acres on 8/5/20.
//  Copyright © 2020 Sean Acres. All rights reserved.
//

#import "SMAFavoriteArtist+NSJSONSerialization.h"

@implementation SMAFavoriteArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *artistName = [dictionary objectForKey:@"strArtist"];
    if ([artistName isKindOfClass:NSNull.class]) artistName = nil;
    else if (![artistName isKindOfClass:NSString.class]) return nil;
    
    NSString *biography = [dictionary objectForKey:@"strBiographyEN"];
    if ([biography isKindOfClass:NSNull.class]) biography = nil;
    else if (![biography isKindOfClass:NSString.class]) return nil;
    
    NSString *formationDate = [dictionary objectForKey:@"intFormedYear"];
    if ([formationDate isKindOfClass:NSNull.class]) formationDate = nil;
//    else if (![formationDate isKindOfClass:NSNumber.class]) return nil;
    
    
    return [self initWithArtistName:artistName
                          biography:biography
                      formationDate:formationDate.doubleValue];
}

- (NSDictionary *)toDictionary
{
    return @{ @"strArtist": self.artistName,
              @"intFormedYear": [NSNumber numberWithDouble:self.formationDate],
              @"strBiographyEN": self.biography };
}

@end
