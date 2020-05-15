//
//  WAHArtist.m
//  Favorite Artists
//
//  Created by Wyatt Harrell on 5/15/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

#import "WAHArtist.h"

@implementation WAHArtist

- (instancetype)initWithArtist:(NSString *)artist
                     biography:(NSString *)biography
                    yearFormed:(int)yearFormed {
    self = [super init];
    if (self) {
        _artist = [artist copy];
        _biography = [biography copy];
        _yearFormed = yearFormed;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *artist = dictionary[@"strArtist"];
    NSString *biography = dictionary[@"strBiographyEN"];
    NSNumber *yearFormedNS = dictionary[@"intFormedYear"];

    if ([yearFormedNS isKindOfClass:[NSNull class]]) { yearFormedNS = nil; }
//    if ([artist isKindOfClass:[NSNull class]]) { artist = nil; }
//    if ([biography isKindOfClass:[NSNull class]]) { biography = nil; }
    
    int yearFormed = yearFormedNS.intValue;

    return [self initWithArtist:artist
                      biography:biography
                     yearFormed:yearFormed];
}

@end
