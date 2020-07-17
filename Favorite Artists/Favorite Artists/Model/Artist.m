//
//  Artist.m
//  Favorite Artists
//
//  Created by Vincent Hoang on 7/17/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

#import "Artist.h"

@implementation Artist : NSObject

- (instancetype)initWithName:(NSString *)name
                         bio:(NSString *)bio
                      formed:(int)formed {
    
    self = [super init];
    
    if (self) {
        _name = name;
        _bio = bio;
        _formed = formed;
    }
    
    return self;
}

@end
