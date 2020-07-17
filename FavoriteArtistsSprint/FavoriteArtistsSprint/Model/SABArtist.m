//
//  SABArtist.m
//  FavoriteArtistsSprint
//
//  Created by Stephanie Ballard on 7/17/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

#import "SABArtist.h"

@implementation SABArtist

- (instancetype)initWithStrArtist:(NSString *)strArtist
                         strBiographyEN:(NSString *)strBiographyEN
                        intFormedYear:(int)intFormedYear {
    self = [super init];
    if (self) {
        _strArtist = strArtist;
        _strBiographyEN = strBiographyEN;
        _intFormedYear = intFormedYear;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    

    NSString *strArtist = dictionary[@"strArtist"];
    NSString *strBiographyEN = dictionary[@"strBiographyEN"];
    NSNumber *intFormedyear = dictionary[@"intFormedYear"];
    
    return self;
    
}

@end
