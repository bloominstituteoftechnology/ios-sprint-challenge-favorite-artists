//
//  FavoriteArtist+Artist_JSON.h
//  FavoriteArtists
//
//  Created by Craig Belinfante on 12/13/20.
//

#import "FavoriteArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface FavoriteArtist (Artist_JSON)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
