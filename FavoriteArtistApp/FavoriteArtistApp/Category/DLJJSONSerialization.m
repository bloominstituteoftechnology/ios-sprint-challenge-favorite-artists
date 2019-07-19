//
//  DLJJSONSerialization.m
//  FavoriteArtistApp
//
//  Created by Diante Lewis-Jolley on 7/19/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

#import "DLJJSONSerialization.h"

@implementation DLJArtist (NSJSONSerialization)

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {

    NSString *artistName = dictionary[@"strArtist"];
    NSString *bio = dictionary[@"strBiographyEN"];
    NSString *yearFormed = dictionary[@"intFormedYear"];

    return [[DLJArtist alloc]initWithArtistName:artistName biography:bio yearFormed:yearFormed.intValue];
}

-(NSDictionary *)artistDictionary {
    return @{@"strArtist": self.name, @"strBiographyEN": self.bio, @"intFormedYear": @(self.yearFormed) };
}

@end
