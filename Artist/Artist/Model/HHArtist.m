//
//  HHArtist.m
//  Artist
//
//  Created by Hayden Hastings on 7/19/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

#import "HHArtist.h"

@implementation HHArtist

- (instancetype)initWithName:(NSString *)name
                   biography:(NSString *)biography
                  yearFormed:(int)yearFormed {
    self = [super init];
    if (self) {
        _name = name;
        _biography = biography;
        _yearFormed = yearFormed;
    }
    return self;
}

@end
