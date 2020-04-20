//
//  Artist.m
//  FavoriteArtistsSprintChallenge
//
//  Created by Dillon P on 4/19/20.
//  Copyright © 2020 Dillon's Lambda Team. All rights reserved.
//

#import "Artist.h"

@implementation Artist

-(instancetype)initWithArtistName:(NSString *)artistName yearFounded:(int)yearFounded artistBio:(NSString *)artistBio
{
    if (self = [super init]) {
        _artistName = artistName;
        _yearFounded = yearFounded;
        _artistBio = artistBio;
    }
    
    return self;
}

@end
