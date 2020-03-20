//
//  Artist.m
//  Artists
//
//  Created by Alexander Supe on 20.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

#import "Artist.h"

@implementation Artist

- (instancetype)initWithName:(NSString *)name biography:(NSString *)biography yearFormed:(int)yearFormed {
    if (self = [super init]) {
        _name = name;
        _biography = biography;
        _yearFormed = yearFormed;
    }
    return self;
}

@end
