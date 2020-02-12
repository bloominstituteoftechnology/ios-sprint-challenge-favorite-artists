//
//  Artist.m
//  FavoriteArtists
//
//  Created by Bobby Keffury on 2/7/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

#import "Artist.h"

@implementation Artist

- (instancetype)initWithName:(NSString *)name founded:(NSString *)founded details:(NSString *)details
{
    self = [super init];
    if (self) {
        _name = name;
        _founded = founded;
        _details = details;
    }
    return self;
}

@end
