//
//  BRDArtist+NSJSONSerialization.h
//  My Favorite Artist
//
//  Created by Bradley Diroff on 6/12/20.
//  Copyright © 2020 Bradley Diroff. All rights reserved.
//

#import "BRDArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface BRDArtist (NSJSONSerialization)

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
