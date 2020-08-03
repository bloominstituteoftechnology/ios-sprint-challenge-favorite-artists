//
//  LSIArtist.m
//  FavoriteArtists
//
//  Created by Kelson Hartle on 8/2/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

#import "LSIArtist.h"

@implementation LSIArtist

- (instancetype)initWithArtistName:(NSString *)artistName
                        yearFormed:(NSNumber *)yearFormed
                         biography:(NSString *)biography {
    
    self = [super init];
    
    if (self) {
        _artistName = [artistName copy];
        _yearFormed = yearFormed;
        _biography = [biography copy];
        
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *artistName = dictionary[@"strArtist"];
    NSNumber *yearFormed = dictionary[@"intFormedYear"];
    NSString *biography = dictionary[@"strBiographyEN"];
    
    if (!(yearFormed && biography)) {
        return nil;
    }
    
    self = [self initWithArtistName:artistName yearFormed:yearFormed biography:biography];
    return self;
}


@end
