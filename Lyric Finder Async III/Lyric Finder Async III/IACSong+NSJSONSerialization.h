//
//  IACSong+NSJSONSerialization.h
//  Lyric Finder Async III
//
//  Created by Ivan Caldwell on 3/10/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

#import "IACSong.h"

NS_ASSUME_NONNULL_BEGIN

@interface IACSong (NSJSONSerialization)

- (instancetype)initWithDictionary: (NSDictionary *)dictionary;
- (NSDictionary *)songDictionary;

@end

NS_ASSUME_NONNULL_END
