//
//  CAMArtist+Serialization.h
//  FavoriteArtists
//
//  Created by Cody Morley on 7/17/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CAMArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface CAMArtist (Serialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)createDictionary;

@end

NS_ASSUME_NONNULL_END
