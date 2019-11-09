//
//  Artist.m
//  Favorite Artists
//
//  Created by Michael Stoffer on 11/9/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

#import "Artist.h"

@implementation Artist

- (instancetype)initWithArtistName:(NSString *)artist biography:(NSString *)biography formed:(int)formed
{
    if (self = [super init]) {
        _name = artist.copy;
        _bio = biography.copy;
        _yearFormed = formed;
    }
    return self;
}

@end
