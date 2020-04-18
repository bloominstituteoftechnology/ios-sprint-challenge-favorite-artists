//
//  LTBLyricController.h
//  LyricFinder
//
//  Created by Linh Bouniol on 10/5/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LTBLyric;

NS_ASSUME_NONNULL_BEGIN

@interface LTBLyricController : NSObject

@property (nonatomic, readonly) NSArray<LTBLyric *> *lyrics;

- (void)createWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating;

- (void)updateLyrics:(LTBLyric *)lyrics title:(NSString *)title artist:(NSString *)artist;

- (void)loadLyricsWithTitle:(NSString *)title artist:(NSString *)artist completion:(void (^)(NSString *lyric, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
