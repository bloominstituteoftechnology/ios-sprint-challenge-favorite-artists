//
//  NNEArtist+NSJSONSerialization.h
//  FavoriteArtists
//
//  Created by Nonye on 7/17/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NNEArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface NNEArtist (NSJSONSerialization)

/// To decode from JSON
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

/// To decode from documents
- (instancetype)initWithDict:(NSDictionary *)dict;

/// Used to save to documents
- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
