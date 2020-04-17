//
//  Artist.m
//  Art
//
//  Created by Nick Nguyen on 4/17/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

#import "NPTArtist.h"

@implementation NPTArtist



- (instancetype)initWithName:(NSString *)name biography:(NSString *)biography yearFormed:(int)yearFormed {
    self = [super init];
    if (self) {
        _name = name;
        _biography = biography;
        _yearFormed = yearFormed;
    }
    return self;
}



@end
