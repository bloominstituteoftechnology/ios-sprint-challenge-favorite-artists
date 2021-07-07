//
//  DYPSong.m
//  LyricFinder
//
//  Created by Daniela Parra on 11/16/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

#import "DYPSong.h"

@implementation DYPSong

- (instancetype)initWithTitle:(NSString *)title artistName:(NSString *)artistName lyrics:(NSString *)lyrics rating:(NSInteger)rating
{
    self = [super init];
    if (self) {
        _title = [title copy];
        _artistName = [artistName copy];
        _lyrics = [lyrics copy];
        _rating = rating;
    }
    return self;
}

@end
