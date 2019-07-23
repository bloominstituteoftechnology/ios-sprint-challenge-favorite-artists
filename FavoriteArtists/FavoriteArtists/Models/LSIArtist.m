//
//  LSIArtist.m
//  FavoriteArtists
//
//  Created by Alex on 7/19/19.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "LSIArtist.h"

@implementation LSIArtist

- (instancetype) initWithName:(NSString *)name formed:(int)formed bio:(NSString *)bio {
    
    if (self = [super init]) {
        _name = [name copy];
        _formed = formed;
        _bio = [bio copy];
    }
    return self;
}



@end
