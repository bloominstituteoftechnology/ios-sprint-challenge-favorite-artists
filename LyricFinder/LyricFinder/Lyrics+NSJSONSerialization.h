//
//  Lyrics+NSJSONSerialization.h
//  LyricFinder
//
//  Created by Austin Cole on 3/1/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import "Lyrics.h"

NS_ASSUME_NONNULL_BEGIN

@interface Lyrics (NSJSONSerialization)

- (instancetype)initWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
