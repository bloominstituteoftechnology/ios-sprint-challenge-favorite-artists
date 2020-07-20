//
//  HMRArtist+NSJSONSerialization.h
//  FavoriteArtist
//
//  Created by Harmony Radley on 7/17/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HMRArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface HMRArtist (NSJSONSerialization)

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (instancetype)initWithDict:(NSDictionary *)dict;

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
