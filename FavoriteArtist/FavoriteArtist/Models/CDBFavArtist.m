//
//  CDBFavArtist.m
//  FavoriteArtist
//
//  Created by Ciara Beitel on 11/8/19.
//  Copyright © 2019 Ciara Beitel. All rights reserved.
//

#import "CDBFavArtist.h"

@implementation CDBFavArtist

- (instancetype) initWithName:(NSString *)name yearFormed:(NSString *)year biography:(NSString *)biography {
    if (self = [super init]) {
        _name = name;
        _year = year;
        _biography = biography;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSArray *artistArray = dictionary[@"artists"];
    NSDictionary *artistDict = [artistArray firstObject];
    NSString *name = artistDict[@"strArtist"];
    NSString *year = artistDict[@"intFormedYear"];
    NSString *biography = artistDict[@"strBiographyEN"];
    return [self initWithName:name yearFormed:year biography:biography];
}

@end
