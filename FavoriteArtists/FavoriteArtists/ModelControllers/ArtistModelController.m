//
//  ArtistModelController.m
//  FavoriteArtists
//
//  Created by John McCants on 2/18/21.
//

#import "ArtistModelController.h"

@implementation ArtistModelController

-(instancetype)init
{
    if (self = [super init]) {
        _artists = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
