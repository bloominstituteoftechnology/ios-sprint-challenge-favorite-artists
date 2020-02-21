//
//  RWArtist.m
//  Favorite Artists
//
//  Created by Rick Wolter on 2/21/20.
//  Copyright © 2020 Devshop7. All rights reserved.
//

#import "RWArtist.h"


@implementation RWArtist

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    NSString *name = dictionary[@"strArtist"];
    NSString *bio = dictionary[@"strBiographyEN"];
    NSString *yearFormedString = (dictionary[@"intFormedYear"] == (id)[NSNull null] ) ? 0 :  [dictionary objectForKey:@"intFormedYear"];
    
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

- (NSDictionary *)toDictionary {
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    [dictionary setValue:self.name forKey:@"strArtist"];
    [dictionary setValue:self.bio forKey:@"strBiographyEN"];
    [dictionary setValue:[NSString stringWithFormat:@"%ld", (long)self.yearFormed] forKey:@"intFormedYear"];
    
    return dictionary;
}

@end
