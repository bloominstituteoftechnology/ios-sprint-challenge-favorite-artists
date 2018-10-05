//
//  AELSongController.m
//  Lyric Finder
//
//  Created by Andrew Dhan on 10/5/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

#import "AELSongController.h"
#import "AELSong.h"

@interface AELSongController()

@property NSMutableArray *internalSongs;

@end

@implementation AELSongController

#pragma mark -Initializers
- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalSongs = [NSMutableArray init];
    }
    return self;
}
#pragma mark - CRUD functions

-(void) addSongWithTitle:(NSString *) title artist: (NSString *) artist lyrics: (NSString *) lyrics rating: (NSUInteger) rating
{
    AELSong *newSong = [[AELSong alloc] initWithTitle:title artist:artist lyrics:lyrics rating:rating];
    [[self internalSongs] addObject:newSong];
}

-(void) updateSong:(AELSong *) song lyrics: (NSString*) lyrics rating: (NSUInteger) rating
{
    NSInteger index = [[self internalSongs] indexOfObject:song];
    [[self internalSongs] removeObject:song];
    [song setLyrics:lyrics];
    [song setRating:rating];
    [[self internalSongs] insertObject:song atIndex:index];
    
}

-(void) deleteSong:(AELSong *) song
{
    [[self internalSongs] removeObject:song];
}

#pragma mark -Properties
-(NSArray *) songs{
    return [[self internalSongs] copy];
}
@end
