//
//  SABArtist.m
//  FavoriteArtistsSprint
//
//  Created by Stephanie Ballard on 7/17/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

#import "SABArtist.h"

@implementation SABArtist

- (instancetype)initWithArtistName:(NSString *)artistName
                         biography:(NSString *)biography
                        yearFormed:(int)yearFormed {
    self = [super init];
    if (self) {
        _artistName = artistName;
        _biography = biography;
        _yearFormed = yearFormed;
    }
    return self;
}

@end
