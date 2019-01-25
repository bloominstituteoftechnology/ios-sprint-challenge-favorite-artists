//
//  YZINSObject+JSONSerialization.h
//  Lyrics-Finder
//
//  Created by Yvette Zhukovsky on 1/25/19.
//  Copyright © 2019 Yvette Zhukovsky. All rights reserved.
//

#import "YZISongs.h"

NS_ASSUME_NONNULL_BEGIN

@interface YZISongs (JSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)songDictionary;

@end

NS_ASSUME_NONNULL_END
