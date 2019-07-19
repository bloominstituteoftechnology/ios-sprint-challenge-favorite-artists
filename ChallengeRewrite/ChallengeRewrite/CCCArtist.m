//
//  CCCArtist.m
//  ChallengeRewrite
//
//  Created by Ryan Murphy on 7/19/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

#import "CCCArtist.h"

@implementation CCCArtist

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        
        NSDictionary *dict = [dictionary[@"artists"] firstObject];
        _name = dict[@"strArtist"];
        _biography = dict[@"strBiographyEN"];
        
        NSString *yearString = dict[@"intFormedYear"];
        _yearFormed = [yearString intValue];
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

- (NSDictionary *)dictionaryRep {
    
    NSNumber *year = [NSNumber numberWithInt:self.yearFormed];
    
    return @{@"strArtist": self.name, @"strBiographyEN": self.biography, @"intFormedYear": year.stringValue};
}

@end
