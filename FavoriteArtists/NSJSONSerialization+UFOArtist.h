//
//  NSJSONSerialization+UFOArtist.h
//  FavoriteArtists
//
//  Created by Ufuk Türközü on 17.04.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

#import "UFOArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSJSONSerialization (UFOArtist)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
