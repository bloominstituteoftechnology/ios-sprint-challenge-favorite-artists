//
//  WASArtist.m
//  FavoriteArtists_OBJC
//
//  Created by Alex Shillingford on 2/21/20.
//  Copyright © 2020 shillwil. All rights reserved.
//

#import "WASArtist.h"

@implementation WASArtist

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {

    self = [super init];
    if (self) {

        NSDictionary *dict = [dictionary[@"artists"] firstObject];
        _name = dict[@"strArtist"];
        _biography = dict[@"strBiographyEN"];

        NSString *yearFormedAsString = dict[@"intFormedYear"];
        _yearFormed = [yearFormedAsString intValue];
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name biography:(NSString *)biography yearFormed:(int)yearFormed {

    self = [super init];
    if (self) {
        _name = name;
        _biography = biography;
        _yearFormed = yearFormed;
    }
    return self;
}

- (NSDictionary *)dictionaryRep {
    NSNumber *year = [NSNumber numberWithInt:self.yearFormed];

    return @{@"strArtist": self.name, @"strBiographyEN": self.biography, @"intFormedYear": year.stringValue};
}

@end
