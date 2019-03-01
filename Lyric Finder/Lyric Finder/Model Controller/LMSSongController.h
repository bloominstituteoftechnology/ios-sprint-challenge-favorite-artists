//
//  LMSSongController.h
//  Lyric Finder
//
//  Created by Lisa Sampson on 3/1/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LMSSong.h"

typedef void (^CompletionHandler)(NSString *);

NS_ASSUME_NONNULL_BEGIN

@interface LMSSongController : NSObject

@property (readonly) NSMutableArray *lyrics;

- (void)createLyricsWithArtist: (NSString *)artist andTrackName: (NSString *)trackName andLyrics: (NSString *)lyrics andRating: (int)rating;

- (void)fetchSongLyrics: (NSString *)artist andTrackName: (NSString *)trackName withCompletion: (CompletionHandler)completion;

@end

NS_ASSUME_NONNULL_END
