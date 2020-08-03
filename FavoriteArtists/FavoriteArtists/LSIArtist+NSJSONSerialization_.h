//
//  LSIArtist+NSJSONSerialization_.h
//  Favorite Artists
//
//  Created by Kelson Hartle on 7/20/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

#import "LSIArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSIArtist (NSJSONSerialization_)

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
