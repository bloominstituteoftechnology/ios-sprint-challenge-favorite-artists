//
//  DPRArtist.m
//  Favorite Artists
//
//  Created by Dennis Rudolph on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "DPRArtist.h"

@implementation DPRArtist

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    NSString *name = dictionary[@"strArtist"];
    NSString *bio = dictionary[@"strBiographyEN"];
    NSString *yearFormedString = dictionary[@"intFormedYear"];
    
    NSInteger yearFormed = [yearFormedString integerValue];
    
    return [self initWithName:name yearFormed:yearFormed bio:bio];
}

- (instancetype)initWithName:(NSString *)name
                  yearFormed:(NSInteger)yearFormed
                         bio:(NSString *)bio {
    self = [super init];
    if (self) {
        _name = name;
        _yearFormed = yearFormed;
        _bio = bio;
    }
    return self;
}

@end
