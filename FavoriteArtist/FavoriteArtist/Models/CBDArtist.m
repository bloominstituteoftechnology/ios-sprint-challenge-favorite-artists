//
//  CBDArtist.m
//  FavoriteArtist
//
//  Created by Christopher Devito on 5/15/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

#import "CBDArtist.h"

@implementation CBDArtist

- (instancetype)initWithStrArtist:(NSString *)strArtist
                       yearFormed:(int)yearFormed
                   strBiographyEN:(NSString *)strBiographyEN {
    self = [super init];
    if (self) {
        _strArtist = strArtist;
        _yearFormed = yearFormed;
        _strBiographyEN = strBiographyEN;
    }
    
    return self;
}

@end
