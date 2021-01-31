//
//  Artist+NSJSONSerialization.h
//  FavArtist
//
//  Created by Norlan Tibanear on 11/30/20.
//

#import "Artist.h"

NS_ASSUME_NONNULL_BEGIN

@interface Artist (NSJSONSerialization)

- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;


@end

NS_ASSUME_NONNULL_END
