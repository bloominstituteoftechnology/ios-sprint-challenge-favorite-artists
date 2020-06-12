//
//  CMDArtist+JSONHelper.h
//  FavoriteArtists
//
//  Created by Chris Dobek on 6/12/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

#import "CMDArtist.h"

NS_ASSUME_NONNULL_BEGIN

@class CMDArtist;

@interface CMDArtist (JSONHelper)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
