//
//  Artist+Artist_NSJSONSerialization.h
//  FavoriteArtists
//
//  Created by Joel Groomer on 2/8/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

#import "Artist.h"

NS_ASSUME_NONNULL_BEGIN

@interface Artist (Artist_NSJSONSerialization)

+ (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
