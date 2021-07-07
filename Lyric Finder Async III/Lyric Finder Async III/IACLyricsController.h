//
//  IACLyricsController.h
//  Lyric Finder Async III
//
//  Created by Ivan Caldwell on 3/10/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IACSong.h"

typedef void (^CompletionHandler)(IACSong *, NSError *);

NS_ASSUME_NONNULL_BEGIN

@interface IACLyricsController : NSObject

@property NSMutableArray *songs;

- (instancetype) init;
- (void) createSongWithTitle:(NSString *)title
                      artist:(NSString *)artist
                      lyrics:(NSString *)lyrics
                      rating:(int)rating;

- (void) updateSong:(IACSong *)song rating:(int)rating;
- (void) deleteSong:(IACSong *)song;
- (void) fetchLyricsForTitle:(NSString *)title artist:(NSString *)artist completionBlock: (CompletionHandler)completionBlock;
@end

NS_ASSUME_NONNULL_END
