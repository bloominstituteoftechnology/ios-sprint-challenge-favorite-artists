//
//  JKLyricFinderController.h
//  LyricFinder
//
//  Created by TuneUp Shop  on 3/1/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKSong.h"


typedef void (^CompletionBlock)(NSError *error);

NS_ASSUME_NONNULL_BEGIN

@interface JKLyricFinderController : NSObject

@property NSDictionary *songs;

- (instancetype)init;

- (void)fetchSongInfoByArtist: (NSString *)artist andWithTitle: (NSString *)title withBlock: (CompletionBlock)block;

@end

NS_ASSUME_NONNULL_END
