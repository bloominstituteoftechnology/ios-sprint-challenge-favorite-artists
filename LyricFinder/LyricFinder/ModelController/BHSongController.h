//
//  BHSongController.h
//  LyricFinder
//
//  Created by Benjamin Hakes on 3/1/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BHSong.h"

NS_ASSUME_NONNULL_BEGIN

@interface BHSongController : NSObject

@property NSMutableArray *songs;
@property NSFileManager *fileManager;

// create
-(void)createSong: (BHSong *)song;

// update
-(void)updateSong: (BHSong *)updatedSong;

// delete
-(void)deleteSong: (BHSong *)songToDelete;


@end

NS_ASSUME_NONNULL_END
