//
//  EPWArtist.m
//  Favorite-Artists Sprint
//
//  Created by Elizabeth Wingate on 4/17/20.
//  Copyright © 2020 Lambda. All rights reserved.
//

#import "EPWArtist.h"

@implementation EPWArtist

- (instancetype)initWithName:(NSString *)name
                  formedYear:(NSUInteger)formedYear
                   biography:(NSString *)biography
  {
    if (self = [super init]) {
        _name = name;
        _formedYear = formedYear;
        _biography = biography;
    }
    return self;
}

@end
