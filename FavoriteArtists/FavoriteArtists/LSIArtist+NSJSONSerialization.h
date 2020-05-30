//
//  LSIArtist+NSJSONSerialization.h
//  FavoriteArtists
//
//  Created by Alex Thompson on 5/30/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSIArtists.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSIArtists (NSJSONSerialization)

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
