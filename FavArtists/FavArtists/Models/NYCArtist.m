//
//  NYCArtist.m
//  FavArtists
//
//  Created by Nathanael Youngren on 4/5/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

#import "NYCArtist.h"

@implementation NYCArtist

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        
        NSDictionary *internalDict = [dictionary[@"artists"] firstObject];
        _name = internalDict[@"strArtist"];
        _biography = internalDict[@"strBiographyEN"];
        
        NSString *yearFormedAsString = internalDict[@"intFormedYear"];
        _yearFormed = [yearFormedAsString intValue];
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name biography:(NSString *)biography andYearFormed:(int)yearFormed {
    
    self = [super init];
    if (self) {
        _name = name;
        _biography = biography;
        _yearFormed = yearFormed;
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    
    NSNumber *year = [NSNumber numberWithInt:self.yearFormed];
    
    return @{@"strArtist": self.name, @"strBiographyEN": self.biography, @"intFormedYear": year.stringValue};
}

@end
