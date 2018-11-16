//
//  SongController.m
//  Lyric Finder
//
//  Created by Moin Uddin on 11/16/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

#import "SongController.h"

@interface  SongController ()
@property (nonatomic, copy) NSMutableArray *internalSongs;
@end

@implementation SongController


- (void)createSongWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger *)rating
{
    Song *song =  [[[Song alloc] init] initWithTitle:title artist:artist lyrics:lyrics rating:rating];
    [self.internalSongs addObject:song];
}

- (void)changeRatingOfSong:(Song *)song rating:(NSInteger *)rating
{
    song.rating = rating;
}

-(NSArray *)songs {
    return [self.internalSongs copy];
}

@end
