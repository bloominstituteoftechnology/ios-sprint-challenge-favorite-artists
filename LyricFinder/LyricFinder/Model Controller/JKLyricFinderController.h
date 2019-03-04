//
//  JKLyricFinderController.h
//  LyricFinder
//
//  Created by TuneUp Shop  on 3/1/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKSong.h"

@class JKSong;

typedef void (^JKSongCompletionBlock)(JKSong * _Nullable, NSError * _Nullable);

NS_ASSUME_NONNULL_BEGIN

@interface JKLyricFinderController : NSObject

@property (nonatomic) NSArray *savedSongs;

- (instancetype)init;

- (void)saveSong:(JKSong *)song;

- (void)removeSavedSong:(JKSong *)song;

- (void)saveToNSUserDefaults;

- (void)fetchSongInfoByArtist: (NSString *)artist andWithTitle: (NSString *)title withBlock: (JKSongCompletionBlock)block;

@end

NS_ASSUME_NONNULL_END
