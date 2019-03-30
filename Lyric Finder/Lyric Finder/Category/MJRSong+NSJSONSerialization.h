//
//  MJRSong+NSJSONSerialization.h
//  Lyric Finder
//
//  Created by Moses Robinson on 3/29/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

#import "MJRSong.h"

NS_ASSUME_NONNULL_BEGIN

@interface MJRSong (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryFromObject;

@end

NS_ASSUME_NONNULL_END
