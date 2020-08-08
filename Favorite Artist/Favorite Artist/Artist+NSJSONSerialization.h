//
//  Artist+NSJSONSerialization.h
//  Favorite Artist
//
//  Created by Gerardo Hernandez on 8/8/20.
//  Copyright © 2020 Gerardo Hernandez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Artist.h"

NS_ASSUME_NONNULL_BEGIN

@interface Artist (NSJSONSerialization)

- (nullable instancetype)initwithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
