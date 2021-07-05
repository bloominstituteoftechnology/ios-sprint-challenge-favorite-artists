//
//  ABCSongController.h
//  LyricFinder
//
//  Created by Austin Cole on 3/1/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Song.h"

NS_ASSUME_NONNULL_BEGIN

@interface ABCSongController : NSObject

@property NSMutableArray *savedSongsArray;

- (void)saveSongwithTrack: (NSString *)track withArtist: (NSString *)artist withLyrics: (NSString *)lyrics withRating: (NSInteger)rating;
- (NSArray *)loadSongs;
@end

NS_ASSUME_NONNULL_END
