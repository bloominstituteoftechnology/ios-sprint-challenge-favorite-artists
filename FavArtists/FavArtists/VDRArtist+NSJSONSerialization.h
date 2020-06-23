//
//  VDRArtist+NSJSONSerialization.h
//  FavArtists
//
//  Created by Victor  on 7/19/19.
//  Copyright © 2019 Victor . All rights reserved.
//

#import "VDRArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface VDRArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)createArtistDictionary;

@end

NS_ASSUME_NONNULL_END
