//
//  TXCArtist.m
//  FavoriteArtists
//
//  Created by Thomas Cacciatore on 7/19/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

#import "TXCArtist.h"

@implementation TXCArtist

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _name = dictionary[@"strArtist"];
        _biography = dictionary[@"strBiographyEN"];
        _dateFormed = [dictionary[@"intFormedYear"] integerValue];
    }
    return self;
}


@end
