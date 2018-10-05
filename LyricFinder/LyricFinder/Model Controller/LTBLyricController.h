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

- (void)createLyricWithTitle:(NSString *)title artist:(NSString *)artist;
- (void)updateLyric:(LTBLyric *)lyric title:(NSString *)title artist:(NSString *)artist;

- (void)loadLyricsWithTitle:(NSString *)title artist:(NSString *)artist completion:(void (^)(LTBLyric *lyric, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
