//
//  AMCArtist.m
//  FavArtist
//
//  Created by Aaron Cleveland on 3/20/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

#import "AMCArtist.h"

@implementation AMCArtist

- (instancetype)initWithArtistName:(NSString *)artist biography:(NSString *)biography formed:(int)formed
{
    if (self = [super init])
    {
        _name = artist.copy;
        _bio = biography.copy;
        _yearFormed = formed;
    }
    
    return self;
}

@end
