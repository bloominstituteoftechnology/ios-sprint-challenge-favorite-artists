//
//  LSIArtist.m
//  FavoriteArtists
//
//  Created by Alex on 7/19/19.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "LSIArtist.h"

@implementation LSIArtist

- (instancetype) initWithName:(NSString *)name formed:(NSInteger)formed bio:(NSString *)bio {
    
    if (self = [super init]) {
        _name = name;
        _formed = formed;
        _bio = bio;
    }
    return self;
}



@end
