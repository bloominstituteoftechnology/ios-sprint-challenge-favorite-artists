//
//  Artist+JSONSerialization.h
//  FavoriteArtists
//
//  Created by Clayton Watkins on 9/25/20.
//

#import "Artist.h"

NS_ASSUME_NONNULL_BEGIN

@interface Artist (JSONSerialization)

- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
