//
//  SHSongController.h
//  LyricFinder
//
//  Created by Sean Hendrix on 3/1/19.
//  Copyright © 2019 Sean Hendrix. All rights reserved.
//

#import "SHSong.h"

NS_ASSUME_NONNULL_BEGIN

@interface SHSongController : NSObject

- (void) createSongWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating;
- (void) updateSongWithSong:(SHSong *)song title:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating;
- (void) searchForLyricsWithTitle:(NSString *)title artist:(NSString *)artist completion:(void (^)(NSString *lyrics, NSError *))completion;
- (void) loadSongs;
- (void) saveSong;
- (void) changeRatingOfSong:(SHSong *)song rating:(NSInteger)rating;

@property (nonatomic, readonly) NSArray *songs;

@end

NS_ASSUME_NONNULL_END
