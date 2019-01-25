//
//  NKTSongController.h
//  lyricFinderObjc
//
//  Created by Nikita Thomas on 1/25/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NKTSongController : NSObject

@property (nonatomic, readonly) NSArray *songsProperty;

- (void)getLyricsWithTitle:(NSString *)title artist:(NSString *)artist completion:(void (^)(NSString *, NSError *))completion;

- (void)newSongWithTitle:(NSString *)title artist:(NSString *)artist rating:(NSInteger)rating lyrics:(NSString *)lyrics;

@end

NS_ASSUME_NONNULL_END
