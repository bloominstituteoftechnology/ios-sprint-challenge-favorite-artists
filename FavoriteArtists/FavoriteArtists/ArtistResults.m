//
//  ArtistResults.m
//  FavoriteArtists
//
//  Created by Claudia Maciel on 7/31/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

#import "ArtistResults.h"
#import "Artist.h"

@implementation ArtistResults

- (instancetype)initWithArtists:(NSArray<Artist *> *)artists
{
    self = [super init];
    if (self)
    {
        _artists = artists;
    }
    
    return self;
}

- (instancetype)initwithDictionary:(NSDictionary *)dictionary
{
    return nil;
}
@end
