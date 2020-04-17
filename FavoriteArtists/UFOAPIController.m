//
//  UFOAPIController.m
//  FavoriteArtists
//
//  Created by Ufuk Türközü on 17.04.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

#import "UFOAPIController.h"
#import "UFOArtist.h"

static NSString *baseURLString = @"https://theaudiodb.com/api/v1/json/1/search.php?";

@implementation UFOAPIController

- (instancetype)initWithArtists:(NSArray *)artists {
    self = [super init];
    if (self) {
        _artists = artists;
    }
    return self;
}

@end
