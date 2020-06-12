//
//  LSIArtist.m
//  FavoriteArtists
//
//  Created by Bhawnish Kumar on 6/12/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

#import "LSIArtist.h"

@implementation LSIArtist

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
    NSNumber *yearFormedNew = dictionary[@"intFormedYear"];
    
    if ([yearFormedNew isKindOfClass:[NSNull class]]) { yearFormedNew = nil; }
    
    int yearlyFormed = yearFormedNew.intValue;
    
    return [self initWithArtist:artist biography:biography yearFormed:yearlyFormed];
}



@end
