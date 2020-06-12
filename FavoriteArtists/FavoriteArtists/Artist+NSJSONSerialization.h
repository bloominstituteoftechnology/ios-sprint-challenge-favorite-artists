//
//  Arist+NSJSONSerialization.h
//  FavoriteArtists
//
//  Created by Jessie Ann Griffin on 6/1/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Artist (NSJSONSerialization) // a category is like an extension

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
