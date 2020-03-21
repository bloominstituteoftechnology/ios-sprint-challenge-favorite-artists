//
//  MBMArtist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Michael on 3/20/20.
//  Copyright © 2020 Michael. All rights reserved.
//

#import "MBMArtist+NSJSONSerialization.h"
#import "ArtistFetcher.h"
#import "MBMArtistResults.h"

@implementation MBMArtist (NSJSONSerialization)

- (NSMutableDictionary *)toDictionary {
    
    id objects[] = { self.artistName, [NSNumber numberWithInt:self.yearFormed], self.artistBiography };
    id keys[] = { @"strArtist", @"intFormedYear", @"strBiographyEN" };
    NSUInteger count = sizeof(objects) / sizeof(id);
    NSMutableDictionary *artistDict = [NSMutableDictionary dictionaryWithObjects:objects
                                                                         forKeys:keys
                                                                           count:count];
    
    return artistDict;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *artistName = dictionary[@"strArtist"];
    NSNumber *yearFormed = dictionary[@"intFormedYear"];
    NSString *artistBiography = dictionary[@"strBiographyEN"];
    
    
    if ([yearFormed isKindOfClass:[NSNull class]]) {
        yearFormed = nil;
    }
    
    if (!(artistName || artistBiography)) {
        return nil;
    }
    
    self = [self initWithArtistName:artistName
                         yearFormed:yearFormed.intValue
                    artistBiography:artistBiography];
    
    return self;
}

@end
