//
//  Song+NSJSONSerialization.h
//  LyricFinder
//
//  Created by Austin Cole on 3/1/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import "Song.h"

NS_ASSUME_NONNULL_BEGIN

@interface Song (NSJSONSerialization)

- (instancetype)initWithDictionary: (NSDictionary *)dictionary;
- (NSDictionary *)songAsDictionary: (Song *)song;

@end

NS_ASSUME_NONNULL_END
