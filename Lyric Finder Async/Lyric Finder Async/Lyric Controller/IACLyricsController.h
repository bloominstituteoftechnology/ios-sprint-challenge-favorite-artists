//
//  IACLyricsController.h
//  Lyric Finder Async
//
//  Created by Ivan Caldwell on 3/8/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IACLyrics.h"

typedef void (^CompletionHandler)(NSString *, NSError *);
NS_ASSUME_NONNULL_BEGIN

@interface IACLyricsController : NSObject
@property NSMutableArray *songs;

- (void)createLyricWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(int)rating;
- (void)updateLyric:(IACLyrics *)song rating:(int)rating;
- (void)deleteLyric:(IACLyrics *)song;
- (void)fetchLyricsForTitle:(NSString *)title artist:(NSString *)artist completionBlock: (CompletionHandler)completionBlock;


@end

NS_ASSUME_NONNULL_END
