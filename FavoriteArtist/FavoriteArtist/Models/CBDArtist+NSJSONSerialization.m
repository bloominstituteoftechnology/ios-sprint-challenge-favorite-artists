//
//  CBDArtist+NSJSONSerialization.m
//  FavoriteArtist
//
//  Created by Christopher Devito on 5/15/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

#import "CBDArtist+NSJSONSerialization.h"
#import "CBDArtist.h"

@implementation CBDArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSArray *artists = dictionary[@"artists"];
    NSDictionary *artist = [artists objectAtIndex:0];
    
    NSString *strArtist = artist[@"strArtist"];
    NSString *intFormedYear = artist[@"intFormedYear"];
    NSString *strBiographyEN = artist[@"strBiographyEN"];
    
    int yearFormed = [intFormedYear intValue];
    
    return [self initWithStrArtist:strArtist yearFormed:yearFormed strBiographyEN:strBiographyEN];
}

- (NSDictionary *)toDictionary {
     
    return [NSDictionary new];
}

@end
