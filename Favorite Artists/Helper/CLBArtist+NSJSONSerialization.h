//
//  CLBArtist+NSJSONSerialization.h
//  Favorite Artists
//
//  Created by Christian Lorenzo on 5/30/20.
//  Copyright © 2020 Christian Lorenzo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLBArtists.h"

NS_ASSUME_NONNULL_BEGIN

@interface CLBArtists (NSJSONSerialization)

- (NSDictionary *)toDictionary;


@end

NS_ASSUME_NONNULL_END
