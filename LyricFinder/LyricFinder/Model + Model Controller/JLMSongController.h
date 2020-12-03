//
//  JLMSongController.h
//  LyricFinder
//
//  Created by Jason Modisett on 1/25/19.
//  Copyright © 2019 Jason Modisett. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JLMSong.h"

NS_ASSUME_NONNULL_BEGIN

@interface JLMSongController : NSObject

- (void) createSongWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating;
- (void) updateSongWithSong:(JLMSong *)song title:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating;
- (void) searchForLyricsWithTitle:(NSString *)title artist:(NSString *)artist completion:(void (^)(NSString *lyrics, NSError *))completion;
- (void) loadSongs;
- (void) saveSong;
- (void) changeRatingOfSong:(JLMSong *)song rating:(NSInteger)rating;

@property (nonatomic, readonly) NSArray *songs;

@end

NS_ASSUME_NONNULL_END
