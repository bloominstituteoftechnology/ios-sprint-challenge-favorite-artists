//
//  SMAFavoriteArtist+NSJSONSerialization.h
//  FavoriteArtists
//
//  Created by Sean Acres on 8/5/20.
//  Copyright © 2020 Sean Acres. All rights reserved.
//

#import "SMAFavoriteArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface SMAFavoriteArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
