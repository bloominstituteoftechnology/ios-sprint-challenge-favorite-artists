//
//  CBDArtist.m
//  FavoriteArtist
//
//  Created by Christopher Devito on 5/15/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

#import "CBDArtist.h"

@implementation CBDArtist

- (instancetype)initWithName:(NSString *)name
                  yearFormed:(int)yearFormed
             details:(NSString *)details {
    self = [super init];
    if (self) {
        _name = name;
        _yearFormed = yearFormed;
        _details = details;
    }
    
    return self;
}

@end
