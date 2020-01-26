//
//  Artist.m
//  FavoriteAritists
//
//  Created by brian vilchez on 1/24/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

#import "Artist.h"

@implementation Artist
 
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
   
    NSString *name = dictionary[@"strArtist"];
    int formedYear = [dictionary[@"intFormedYear"] intValue] ;
    NSString *biography = dictionary[@"strBiographyEN"];
    return [self initWithArtistName:name yearFormed: formedYear biography:biography];
}

- (instancetype)initWithArtistName:(NSString *)artistName yearFormed:(int)yearFormed biography:(NSString *)biorgraphy {
    self = [super init];
    if (self != nil) {
        _artistName = artistName;
        _biography = biorgraphy;
        _yearFormed = yearFormed;
    }
    return self;
}
@end
