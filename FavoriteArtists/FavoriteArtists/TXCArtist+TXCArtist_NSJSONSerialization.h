//
//  TXCArtist+TXCArtist_NSJSONSerialization.h
//  FavoriteArtists
//
//  Created by Thomas Cacciatore on 7/19/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

#import "TXCArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface TXCArtist (TXCArtist_NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
