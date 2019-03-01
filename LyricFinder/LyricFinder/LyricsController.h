//
//  LyricsController.h
//  LyricFinder
//
//  Created by Austin Cole on 3/1/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Lyrics.h"

NS_ASSUME_NONNULL_BEGIN

@interface LyricsController : NSObject

//MARK: Properties
@property NSString *results;

//MARK: Methods
- (void)fetchLyricsWithArtist: (NSString *)artist withTrack: (NSString *)track withCompletionHandler:(void(^)(NSError *error))completionHandler;

@end

NS_ASSUME_NONNULL_END
