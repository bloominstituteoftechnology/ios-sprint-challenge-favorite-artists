//
//  Artist.m
//  FavoriteArtists
//
//  Created by Claudia Maciel on 7/31/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

#import "Artist.h"

@implementation Artist

- (instancetype) init {
    return [self initWithName:@""
                   yearFormed:0 biography:@""];
}


- (instancetype)initWithName:(NSString *)name yearFormed:(int)yearFormed biography:(NSString *)biography {
    
    self = [super init];
    
    if(self)
    {
        _name = name;
        _yearFormed = yearFormed;
        _biography = biography;
    }
    
    return self;
}
@end
