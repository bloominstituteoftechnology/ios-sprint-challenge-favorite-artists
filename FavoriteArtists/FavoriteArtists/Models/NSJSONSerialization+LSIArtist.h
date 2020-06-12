//
//  NSJSONSerialization+LSIArtist.h
//  FavoriteArtists
//
//  Created by Bhawnish Kumar on 6/12/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

#import "LSIArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSIArtist (NSJSONSerialization)

- (NSDictionary *)withDictionary;
@end

NS_ASSUME_NONNULL_END
