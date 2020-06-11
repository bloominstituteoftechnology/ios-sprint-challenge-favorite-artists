//
//  WASArtist.m
//  FavoriteArtists_OBJC
//
//  Created by Alex Shillingford on 2/21/20.
//  Copyright © 2020 shillwil. All rights reserved.
//

#import "WASArtist.h"

@implementation WASArtist

- (instancetype)initWithName:(NSString *)name biography:(NSString *)biography yearFormed:(int)yearFormed {

    if (self = [super init]) {
        _name = name;
        _biography = biography;
        _yearFormed = yearFormed;
    }
    return self;
}

@end
