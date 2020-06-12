//
//  SDJArtist+JSONSerialization.h
//  FavoriteArtists
//
//  Created by Shawn James on 6/12/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDJArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface SDJArtist (NSJSONSerialization)

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
