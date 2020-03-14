//
//  NSObject+FAFNSJSONSerialization.h
//  FAFLyricFinder
//
//  Created by Farhan on 11/16/18.
//  Copyright © 2018 Farhan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FAFSong.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (FAFNSJSONSerialization)

- (FAFSong *)initSongWithDictionary:(NSDictionary *)dictionary rating:(NSInteger)rating artist:(NSString *)artist songName:(NSString *)songName;

- (NSDictionary *)getDictionaryFromSong:(FAFSong *)song;

@end

NS_ASSUME_NONNULL_END
