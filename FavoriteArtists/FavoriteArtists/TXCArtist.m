//
//  TXCArtist.m
//  FavoriteArtists
//
//  Created by Thomas Cacciatore on 7/19/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

#import "TXCArtist.h"

@implementation TXCArtist

- (instancetype)initWithName:(NSString *)name
                   biography:(NSString *)biography
                  dateFormed:(int)dateFormed {
    
    self = [super init];
    if (self) {
        _name = [name copy];
        _biography = [biography copy];
        _dateFormed = dateFormed;
    }
    return self;
}


@end
