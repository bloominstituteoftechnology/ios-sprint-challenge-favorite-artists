//
//  CDGArtist.m
//  FavoriteArtists
//
//  Created by Chris Gonzales on 4/17/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

#import "CDGArtist.h"

@implementation CDGArtist

- (instancetype)initWithArtist:(NSString *)artist
                    formedYear:(NSInteger)formedYear
                     biography:(NSString *)biography {
    self = [super init];
    if (self) {
        _artist = [artist copy];
        _formedYear = formedYear;
        _biography = [biography copy];
    }
    return self;
}

@end
