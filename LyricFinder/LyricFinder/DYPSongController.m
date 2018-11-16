//
//  DYPSongController.m
//  LyricFinder
//
//  Created by Daniela Parra on 11/16/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

#import "DYPSongController.h"

@interface DYPSongController ()

@property (nonatomic, copy) NSMutableArray *internalSongs;

@end

@implementation DYPSongController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalSongs = [@[] mutableCopy];
    }
    return self;
}

- (NSArray *)songs
{
    return self.internalSongs;
}

@end
