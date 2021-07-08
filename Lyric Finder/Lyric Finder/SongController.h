//
//  SongController.h
//  Lyric Finder
//
//  Created by Sean Hendrix on 1/25/19.
//  Copyright © 2019 Sean Hendrix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Song.h"
NS_ASSUME_NONNULL_BEGIN

@interface SongController : NSObject

- (void) createSongWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger *)rating;

- (void) updateSongWithSong:(Song *)song title:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger *)rating;

- (void) searchForLyricsWithTitle:(NSString *)title artist:(NSString *)artist completion:(void (^)(NSString *lyrics, NSError *))completion;

- (void) loadSongs;

- (void) saveSong;

- (void) changeRatingOfSong:(Song *)song rating:(NSInteger *)rating;

@property (nonatomic, readonly) NSArray *songs;

@end

NS_ASSUME_NONNULL_END
