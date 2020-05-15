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

@end
