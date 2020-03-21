//
//  JLAFavoriteArtist+NSJSONSerialization.h
//  FavoriteArtistsSprint
//
//  Created by Jorge Alvarez on 3/20/20.
//  Copyright © 2020 Jorge Alvarez. All rights reserved.
//

#import "JLAFavoriteArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface JLAFavoriteArtist (NSJSONSerialization)

/// To decode from JSON 
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

/// To decode from documents
- (instancetype)initWithDict:(NSDictionary *)dict;

/// Used to save to documents
- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
