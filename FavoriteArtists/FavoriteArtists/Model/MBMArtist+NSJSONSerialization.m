//
//  MBMArtist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Michael on 3/20/20.
//  Copyright © 2020 Michael. All rights reserved.
//

#import "MBMArtist+NSJSONSerialization.h"

@implementation MBMArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *artistName = dictionary[@"strArtist"];
    
    NSNumber *yearFormed = dictionary[@"intFormedYear"];
    
    NSString *artistBiography = dictionary[@"strBiographyEN"];
    
    self = [self initWithArtistName:artistName
                         yearFormed:yearFormed.intValue
                    artistBiography:artistBiography];
    
    return self;
}

@end
