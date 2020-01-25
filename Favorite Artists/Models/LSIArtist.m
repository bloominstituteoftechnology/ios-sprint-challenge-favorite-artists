//
//  LSIArtist.m
//  Favorite Artists
//
//  Created by macbook on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSIArtist.h"

@implementation LSIArtist

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    NSString *name = dictionary[@"strArtist"];
    NSString *year = dictionary[@"intFormedYear"];
    NSString *bio = dictionary[@"strBiographyEN"];
    
    // If you need something inside of an array or another Dictionary
//        NSString *name = dictionary[@"name"][@"firstName"];
    
    
    
    int yearInt = [year intValue];
    
    // returns back an artist object created by what we got from the JSON Dictionary
    return [self initWithName:name biography:bio yearFormed:yearInt];
}

- (instancetype)initWithName:(NSString *)name
                   biography:(NSString *)biography
                  yearFormed:(int)yearFormed {
    
    self = [super init];
    if (self) {
        _name = name;
        _biography = biography;
        _yearFormed = yearFormed;
    }
    return self;
}

@end
