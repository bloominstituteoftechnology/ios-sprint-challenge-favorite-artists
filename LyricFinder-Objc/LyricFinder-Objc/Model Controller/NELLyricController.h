//
//  NELLyricController.h
//  LyricFinder-Objc
//
//  Created by Nelson Gonzalez on 3/29/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NELLyricController : NSObject

- (void)addSongWithTitle:(NSString *)title artist:(NSString *)artist lyric:(NSString *)lyric rating:(int)rating;

- (void)searchLyricsWithTitle:(NSString *)title artist:(NSString *)artist completion:(void (^) (NSString *lyrics, NSError *error))completion;

@property (nonatomic) NSArray *songs;

@end

NS_ASSUME_NONNULL_END
