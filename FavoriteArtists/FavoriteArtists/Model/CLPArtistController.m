//
//  CLPArtistController.m
//  FavoriteArtists
//
//  Created by Chad Parker on 7/31/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

#import "CLPArtistController.h"
#import "CLPArtist.h"

@interface CLPArtistController ()

@property (nonatomic) NSMutableArray *artists;

@end

@implementation CLPArtistController

- (instancetype)init
{
    if (self = [super init]) {
        self.artists = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addArtist:(CLPArtist *)artist
{
    [self.artists addObject:artist];
}

- (NSUInteger)artistCount
{
    return self.artists.count;
}

- (CLPArtist *)artistAtIndex:(int)index
{
    return self.artists[index];
}

@end
