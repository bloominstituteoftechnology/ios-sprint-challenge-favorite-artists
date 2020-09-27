//
//  LSIArtistController.m
//  FavoriteArtists
//
//  Created by Elizabeth Thomas on 9/27/20.
//

#import "LSIArtistController.h"
#import "LSIArtist.h"

@interface LSIArtistController () {
    NSMutableArray *_internalArtists;
}

@end

@implementation LSIArtistController

- (instancetype)init
{
    if (self = [super init]) {
        _internalArtists = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray <LSIArtist *> *)artists
{
    return _internalArtists.copy;
}

- (void)addArtist:(LSIArtist *)artist
{
    [_internalArtists addObject:artist];
}

@end
