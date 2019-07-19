//
//  NSObject+TXCArtist_NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Thomas Cacciatore on 7/19/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

#import "NSObject+TXCArtist_NSJSONSerialization.h"
#import "TXCArtist.h"
@implementation NSObject (TXCArtist_NSJSONSerialization)

- (void)initWithDictionary:(NSDictionary *)dictionary {
    TXCArtist *artist = [[TXCArtist alloc] init];
    artist.name = dictionary[@"strArtist"];
    artist.biography = dictionary[@"strBiographyEN"];
    artist.dateFormed = [dictionary[@"intFormedYear"] integerValue];
}


//- (NSDictionary *)toDictionary {
//
//}

@end
