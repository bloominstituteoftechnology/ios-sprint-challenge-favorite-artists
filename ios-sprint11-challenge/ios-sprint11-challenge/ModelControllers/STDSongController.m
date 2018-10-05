//
//  STDSongController.m
//  ios-sprint11-challenge
//
//  Created by De MicheliStefano on 05.10.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

#import "STDSongController.h"

@interface STDSongController ()

// Internal list of songs that is mutable but not exposed externally
@property NSMutableArray *internalSongs;

@end

@implementation STDSongController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalSongs = [[NSMutableArray alloc] init];
    }
    return self;
}

// MARK: - Public methods

- (void)fetchSongsWithTitle:(NSString *)title artist:(NSString *)artist completion:(void (^)(NSMutableArray *songs, NSError *))completion
{
    
}

- (void)fetchSongsFromLocalStore:(void (^)(NSError *))completion
{
    
}

- (void)persistSongToLocalStore:(STDSong *)song completion:(void (^)(NSError *))completion;
{
    
}


// MARK: - Private methods

// Songs getter which return the internal mutable songs array
- (NSArray *)songs
{
    return [_internalSongs copy];
}


static NSString * const baseURL = @"https://swapi.co/api/people";
static NSString * const apiKey = @"https://swapi.co/api/people";


@end
