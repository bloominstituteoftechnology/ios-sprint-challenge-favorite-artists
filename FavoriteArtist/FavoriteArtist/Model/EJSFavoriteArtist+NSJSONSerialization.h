//
//  EJSFavoriteArtist+NSJSONSerialization.h
//  FavoriteArtist
//
//  Created by Enzo Jimenez-Soto on 7/17/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EJSFavoriteArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface EJSFavoriteArtist (NSJSONSerialization)


// To decode from JSON
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

// To decode from documents
- (instancetype)initWithDict:(NSDictionary *)dict;

// Used to save to documents
- (NSDictionary *)toDictionary;


@end

NS_ASSUME_NONNULL_END
