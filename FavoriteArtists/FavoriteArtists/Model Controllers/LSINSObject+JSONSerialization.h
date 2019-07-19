//
//  LSINSObject+JSONSerialization.h
//  FavoriteArtists
//
//  Created by Alex on 7/19/19.
//  Copyright © 2019 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSIArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSIArtist (JSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)artistDict;

@end

NS_ASSUME_NONNULL_END
