//
//  JDFArtist.m
//  Favorite Artists
//
//  Created by Jonathan Ferrer on 7/19/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//

#import "JDFArtist.h"

@implementation JDFArtist

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
