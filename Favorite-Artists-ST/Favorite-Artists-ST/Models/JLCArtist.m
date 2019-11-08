//
//  JLCArtist.m
//  Favorite-Artists-ST
//
//  Created by Jake Connerly on 11/8/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

#import "JLCArtist.h"

@implementation JLCArtist

- (instancetype)initWithName:(NSString *)artistName
                  yearFormed:(NSString *)yearFormed
                   biography:(NSString *)biography {
    if (self = [super init]) {
        _artistName = artistName;
        _yearFormed = yearFormed;
        _biography = biography;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *artistName = dictionary[@"strArtist"];
    NSString *yearFormed = dictionary[@"intFormedYear"];
    NSString *biography  = dictionary[@"strBiographyEN"];
    
    return [self initWithName:artistName yearFormed:yearFormed biography:biography];
}

@end
