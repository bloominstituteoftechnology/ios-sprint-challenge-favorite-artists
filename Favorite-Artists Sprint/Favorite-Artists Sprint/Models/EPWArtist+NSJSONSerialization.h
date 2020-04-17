//
//  EPWArtist+NSJSONSerialization.h
//  Favorite-Artists Sprint
//
//  Created by Elizabeth Wingate on 4/17/20.
//  Copyright © 2020 Lambda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EPWArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface EPWArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END

