//
//  GLIArtistDetail.m
//  FavoriteArtists
//
//  Created by Julian A. Fordyce on 4/5/19.
//  Copyright © 2019 Julian A. Fordyce. All rights reserved.
//

#import "GLIArtistDetail.h"

@implementation GLIArtistDetail

- (instancetype) initWithName:(NSString *)artistName artistBio:(NSString *)biography yearFormed:(NSInteger)yearFormed
{
    self = [super init];
    if (self) {
        _artistName = artistName;
        _biography = biography;
        _yearFormed = yearFormed;
        
    }
    
    return self;
}

@end
