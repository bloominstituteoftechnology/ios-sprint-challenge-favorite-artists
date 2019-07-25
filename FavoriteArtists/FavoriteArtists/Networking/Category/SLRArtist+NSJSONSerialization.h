//
//  SLRArtist+NSJSONSerialization.h
//  FavoriteArtists
//
//  Created by Sameera Roussi on 7/19/19.
//  Copyright © 2019 Sameera Roussi. All rights reserved.
//

#import "SLRArtist.h"
#import "SLRArtist+NSJSONSerialization.h"

NS_ASSUME_NONNULL_BEGIN

@interface SLRArtist (NSJSONSerialization)

- (instancetype) initWithDictionary: (NSDictionary *)dictionary;

- (NSDictionary *) artistData;

@end

NS_ASSUME_NONNULL_END


// from


// to
