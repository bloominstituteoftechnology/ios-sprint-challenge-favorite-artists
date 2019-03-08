//
//  LyricsJSONSerialisation.h
//  Lyric Finder
//
//  Created by Lotanna Igwe-Odunze on 3/8/19.
//  Copyright © 2019 Sugabelly LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LyricModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LyricsJSONSerialisation : NSJSONSerialization

- (instancetype)initDictionary: (NSDictionary *)dictionary;

- (NSDictionary *)lyricsDictionary;


@end

NS_ASSUME_NONNULL_END
