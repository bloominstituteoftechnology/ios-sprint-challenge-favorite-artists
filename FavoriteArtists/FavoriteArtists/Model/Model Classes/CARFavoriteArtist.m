//
//  CARFavoriteArtist.m
//  FavoriteArtists
//
//  Created by Chad Rutherford on 2/21/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import "CARFavoriteArtist.h"

@implementation CARFavoriteArtist

- (instancetype) initWithName:(NSString *)name
                   yearFormed:(int)yearFormed
                    biography:(NSString *)biography {
    self = [super init];
    if (self) {
        _name = [name copy];
        _yearFormed = yearFormed;
        _biography = [biography copy];
    }
    return self;
}


- (instancetype) initWithDictionary:(NSDictionary *)dictionary {
    NSString *name = dictionary[@"strArtist"];
    NSNumber *yearFormed = dictionary[@"intFormedYear"];
    NSString *biography = dictionary[@"strBiographyEN"];
    
    if ([yearFormed isKindOfClass:[NSNull class]]) {
        yearFormed = nil;
    }
    
    self = [self initWithName:name yearFormed:yearFormed.intValue biography:biography];
    return self;
}
@end
