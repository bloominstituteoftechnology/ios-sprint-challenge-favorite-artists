//
//  JEVArtist.m
//  Favorite Artists
//
//  Created by Joe Veverka on 7/18/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

#import "JEVArtist.h"

@implementation JEVArtist

- (instancetype)initWithName:(NSString *)name
                   biography:(NSString *)biography
                        year:(NSInteger)year
{
    self = [super init];
    
    if(self)
    {
        _name = [name copy];
        _biography = [biography copy];
        _year = year;
    }
    return self;
}

@end
