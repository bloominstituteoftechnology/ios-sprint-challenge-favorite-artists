//
//  NSJSONSerialization+Search.h
//  Lyric-Finder
//
//  Created by Madison Waters on 3/8/19.
//  Copyright © 2019 Jonah Bergevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JDBSong;
@class JDBSongController;

NS_ASSUME_NONNULL_BEGIN

@interface NSJSONSerialization (Search)

- (NSDictionary *)SerializeJSONWithLyrics;



@end

NS_ASSUME_NONNULL_END
