//
//  MTGArtistModel.m
//  Favorite Artists
//
//  Created by Mark Gerrior on 5/15/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

#import "MTGArtist.h"

@implementation MTGArtist

- (instancetype)initWithArtist:(NSString *)artist
                     biography:(NSString *)biography
                    formedYear:(double)formedYear {

    self = [super init];
    if (self != nil) {
        _artist = [artist copy];
        _biography = [biography copy];
        _formedYear = formedYear;
    }
    return self;
}

@end
