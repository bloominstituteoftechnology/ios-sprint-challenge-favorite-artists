//
//  BHSongController.m
//  LyricFinder
//
//  Created by Benjamin Hakes on 3/1/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import "BHSongController.h"
#import "BHSong.h"

@implementation BHSongController

-(instancetype)init{
    self = [super init];
    if (self) {
        _songs = [[NSMutableArray<BHSong *> alloc] init];
        
    }
    return self;
}

// create
-(void)createSong: (BHSong *)song{
    [_songs addObject:song];
    
    
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
}

// delete
-(void)deleteSong: (BHSong *)songToDelete{
    [_songs removeObject:songToDelete];
}
@end
