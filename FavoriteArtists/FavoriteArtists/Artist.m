//
//  Artist.m
//  FavoriteArtists
//
//  Created by Bobby Keffury on 2/7/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

#import "Artist.h"

@implementation Artist

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        
        NSDictionary *properties = [dictionary objectForKey:@"artists"];
        _name = [properties objectForKey:@"strArtist"];
        _founded = [properties objectForKey:@"intFormedYear"];
        _details = [properties objectForKey:@"strBiographyEN"];
    }
    return self;
}


- (NSDictionary *)toDictionary
{
    NSDictionary *dictionary;
    return dictionary;
}

@end
