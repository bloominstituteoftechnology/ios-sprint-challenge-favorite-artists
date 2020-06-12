//
//  CMDArtist.m
//  FavoriteArtists
//
//  Created by Chris Dobek on 6/12/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

#import "CMDArtist.h"

@implementation CMDArtist

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
