//
//  JSKArtist+NSJSONSerialization.h
//  FavoriteArtists
//
//  Created by Josh Kocsis on 9/25/20.
//

#import "JSKArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface JSKArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)toDictionary;


@end

NS_ASSUME_NONNULL_END
