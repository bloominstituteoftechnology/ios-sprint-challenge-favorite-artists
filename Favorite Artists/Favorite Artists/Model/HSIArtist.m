//
//  HSIArtist.m
//  Favorite Artists
//
//  Created by Kenny on 6/12/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

#import "HSIArtist.h"

@implementation HSIArtist

- (instancetype)initWithName:(NSString *)name biography:(NSString *)biography year:(NSInteger)year
{
    self = [super init];

    if (self) {
        _name = [name copy];
        _biography = [biography copy];
        _year = year;
    }
    
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (dictionary) {
        NSString *name = dictionary[@"strArtist"];
        NSString *biography = dictionary[@"strBiographyEN"];
        NSNumber *year = dictionary[@"intFormedYear"];
        if (name && biography && year) {
            return [self initWithName:name biography:biography year:year.intValue];
        }
    }
    return nil;
}

@end
