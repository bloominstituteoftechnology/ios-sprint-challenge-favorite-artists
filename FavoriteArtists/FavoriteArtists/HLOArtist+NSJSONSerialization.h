//
//  Artist+NSJSONSerialization.h
//  FavoriteArtists
//
//  Created by Karen Rodriguez on 5/15/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

#import "HLOArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface HLOArtist (NSJSONSerialization)

- (instancetype)initFromDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
