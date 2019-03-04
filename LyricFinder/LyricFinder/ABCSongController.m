//
//  ABCSongController.m
//  LyricFinder
//
//  Created by Austin Cole on 3/1/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import "ABCSongController.h"
#import "Song+NSJSONSerialization.h"

@implementation ABCSongController {
    NSMutableArray *_savedSongsArray;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _savedSongsArray = [[self loadSongs] mutableCopy];
    }
    return self;
}

- (void)saveSongwithTrack:(NSString *)track withArtist:(NSString *)artist withLyrics:(NSString *)lyrics withRating:(NSInteger)rating {
    Song *song = [[Song alloc] init];
    song.lyrics = lyrics;
    song.title = track;
    song.artist = artist;
    song.rating = rating;

    // TODO: what about the other saved songs?
    NSFileManager *fileManager = NSFileManager.defaultManager;
    [fileManager createDirectoryAtURL:NSBundle.mainBundle.bundleURL withIntermediateDirectories: NO attributes: nil error: nil];
    
    NSDictionary *newDictionary = [song songAsDictionary:song];
    
    [_savedSongsArray addObject:newDictionary];
    for (NSInteger i = 0; i < _savedSongsArray.count -1; i ++) {
        if ([[_savedSongsArray objectAtIndex:i] isKindOfClass: [Song class]] ) {
            Song *song = [_savedSongsArray objectAtIndex:i];
            NSDictionary *songDictionary = [song songAsDictionary:song];
            [_savedSongsArray removeObjectAtIndex:i];
            [_savedSongsArray insertObject:songDictionary atIndex:i];
        }
        
    }
    NSData *data = [NSJSONSerialization dataWithJSONObject: _savedSongsArray options:NSJSONWritingPrettyPrinted error:nil];
    
    NSString* fileAtPath = [self songsFile];
    
    if (![fileManager fileExistsAtPath:fileAtPath]) {
        [fileManager createFileAtPath:fileAtPath contents:nil attributes:nil];
    }
    
    [data writeToFile:fileAtPath atomically:NO];
    
    for (NSInteger i = 0; i < _savedSongsArray.count -1; i ++) {
        NSDictionary * songDictionary = [_savedSongsArray objectAtIndex:i];
        [_savedSongsArray removeObjectAtIndex:i];
        Song *song = [[Song alloc] initWithDictionary:songDictionary];
        [_savedSongsArray insertObject:song atIndex:i];
    }
}

- (NSString *)songsFile {
    
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"songs.json";
    return [filePath stringByAppendingPathComponent:fileName];
}

- (NSArray *)loadSongs {
    NSMutableArray * songsArray = [[NSMutableArray alloc] init];
    NSString *fileAtPath = [self songsFile];
    
    NSFileManager *fileManager = NSFileManager.defaultManager;
    
    if ([fileManager fileExistsAtPath:fileAtPath]) {
        NSData *data = [[NSData alloc] initWithContentsOfFile:fileAtPath];
        _savedSongsArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        for (NSMutableDictionary *songDictionary in _savedSongsArray) {
            Song *song = [[Song alloc] initWithDictionary:songDictionary];
            [songsArray addObject:song];
        }
    }
    return songsArray;
    
}

@end
