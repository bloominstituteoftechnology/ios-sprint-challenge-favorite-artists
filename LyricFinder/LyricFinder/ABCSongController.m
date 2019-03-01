//
//  ABCSongController.m
//  LyricFinder
//
//  Created by Austin Cole on 3/1/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import "ABCSongController.h"

@implementation ABCSongController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _savedSongsArray = [[NSArray alloc] init];
    }
    return self;
}

@end
