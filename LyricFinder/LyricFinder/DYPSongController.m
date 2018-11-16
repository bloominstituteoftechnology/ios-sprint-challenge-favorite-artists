//
//  DYPSongController.m
//  LyricFinder
//
//  Created by Daniela Parra on 11/16/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

#import "DYPSongController.h"
#import "DYPSong.h"

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

- (void)addASongWithTitle:(NSString *)title artistName:(NSString *)artistName lyrics:(NSString *)lyrics rating:(NSInteger)rating
{
    DYPSong *song = [[DYPSong alloc] initWithTitle:title artistName:artistName lyrics:lyrics rating:rating];
    [self.internalSongs addObject:song];
}

- (void)searchLyricsForSongTitle:(NSString *)title artistName:(NSString *)artistName completion:(void (^)(NSString * _Nullable, NSError * _Nullable))completion
{
    
}

- (NSArray *)songs
{
    return self.internalSongs;
}

static NSString * const baseURLString = @"";
static NSString * const APIKey = @"";

@end
