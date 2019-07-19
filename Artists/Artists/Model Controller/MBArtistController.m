//
//  MBArtistController.m
//  Artists
//
//  Created by Mitchell Budge on 7/19/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import "MBArtistController.h"

@implementation MBArtistController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _artists = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)createArtist:(MBArtist *)artist {
    [self.artists addObject:artist];
}

@end
