//
//  SKIArtist+NSJSONSerialization.h
//  FavoriteArtists
//
//  Created by Joshua Rutkowski on 5/31/20.
//

@class SKIArtist;

@interface SKIArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)toDictionary;

@end

