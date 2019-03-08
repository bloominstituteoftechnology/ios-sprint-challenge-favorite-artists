//
//  JDBSongController.h
//  Lyric-Finder
//
//  Created by Madison Waters on 3/8/19.
//  Copyright © 2019 Jonah Bergevin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDBSong.h"

typedef void(^SongCompletion)(NSArray *, NSError *);

NS_ASSUME_NONNULL_BEGIN

@interface JDBSongController : NSObject

@property (nonatomic, readonly) NSArray *lyrics;

-(void) FetchSongWithTitle:(NSString *)title artist:(NSString *)artist completion:(SongCompletion)completion;

@end

NS_ASSUME_NONNULL_END
