//
//  JDKArtist+NSJSONSerialization.h
//  FavoriteArtist
//
//  Created by John Kouris on 2/8/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

#import "JDKArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface JDKArtist (JDKNSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
