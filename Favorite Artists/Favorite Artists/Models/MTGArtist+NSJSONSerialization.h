//
//  MTGArtist+NSJSONSerialization.h
//  Favorite Artists
//
//  Created by Mark Gerrior on 5/15/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

#import "MTGArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface MTGArtist (NSJSONSerialization)

+ (instancetype)initWithDictionary:(NSDictionary *)dictionary;

+ (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
