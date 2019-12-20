//
//  NSJSONSerialization+NKTNSJSONSerialization.h
//  lyricFinderObjc
//
//  Created by Nikita Thomas on 1/25/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKTSong.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSJSONSerialization (NKTNSJSONSerialization)

- (NKTSong *)newSongWithDict:(NSDictionary *)dictionary title:(NSString *)title artist:(NSString *)artist rating:(NSInteger)rating;

- (NSDictionary *)songToDict:(NKTSong *)song;


@end

NS_ASSUME_NONNULL_END
