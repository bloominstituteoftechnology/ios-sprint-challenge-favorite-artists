//
//  LYDArtist.m
//  LYDFavoriateArtist
//
//  Created by Lydia Zhang on 5/15/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

#import "LYDArtist.h"

@implementation LYDArtist

- (instancetype)initWithName:(NSString *)name
                        year:(int)year
                   biography:(NSString *)biography {
    self = [super init];
    if (self){
        _name = [name copy];
        _year = year;
        _biography = [biography copy];
    }
    return self;
}

@end
