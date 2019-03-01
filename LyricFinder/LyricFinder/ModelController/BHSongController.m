//
//  BHSongController.m
//  LyricFinder
//
//  Created by Benjamin Hakes on 3/1/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import "BHSongController.h"
#import "BHSong.h"

@interface BHSongController()


@end

@implementation BHSongController

-(instancetype)init{
    self = [super init];
    if (self) {
        
        // file manager setup
        _fileManager = [[NSFileManager alloc] init];
        _fileManager = [NSFileManager defaultManager];
        NSURL *documentsDirectoryURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
        [_fileManager contentsOfDirectoryAtURL:documentsDirectoryURL includingPropertiesForKeys:nil options:NSDirectoryEnumerationSkipsHiddenFiles error:nil];
        
        if (![self getSongsFromDisk]) {
            _songs = [[NSMutableArray<BHSong *> alloc] init];
        } else {
            _songs = [self getSongsFromDisk];
        }
        
    }
    return self;
}

// create
-(void)createSong: (BHSong *)song{
    [_songs addObject:song];
    
    [self saveSongsToDisk];
}

// update
-(void)updateSong: (BHSong *)updatedSong{
    NSUInteger j = [_songs count];
    
    for (int q = 0; q < j; q++)
    {
        BHSong *thisObject = [_songs objectAtIndex:q];
        BOOL shouldUpdateThisObject = ([updatedSong UUID] == [thisObject UUID]);
        if (shouldUpdateThisObject){
            [_songs removeObjectAtIndex:q];
            [_songs insertObject:updatedSong atIndex:q];
            break;
        }
    }
    
    [self saveSongsToDisk];
}

// delete
-(void)deleteSong: (BHSong *)songToDelete{
    [_songs removeObject:songToDelete];
    [self saveSongsToDisk];
}

// save to local storage
-(void)saveSongsToDisk {
    
    // get the document directory URL
    NSURL *documentsDirectoryURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    
    // append our file name
    NSURL *url = [documentsDirectoryURL URLByAppendingPathComponent:@"Songs.data" isDirectory:NO];
    
    if (![_songs writeToURL:url atomically:YES]) {
        NSLog(@"Failed to writeToURL:'%@'", url);
    }
    
}

-(NSMutableArray*)getSongsFromDisk {
    
    // get the document directory URL
    NSURL *documentsDirectoryURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    
    // append our file name
    NSURL *url = [documentsDirectoryURL URLByAppendingPathComponent:@"Songs.data" isDirectory:NO];
    
    return [[NSMutableArray arrayWithContentsOfURL:url] mutableCopy];

}

@end
