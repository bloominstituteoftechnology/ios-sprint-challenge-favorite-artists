//
//  KTMArtist+KTMNSJSONSerialization.h
//  ObjC-FavoriteArtist
//
//  Created by Kobe McKee on 7/19/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

#import "KTMArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface KTMArtist (KTMNSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)createArtistDictionary;

@end

NS_ASSUME_NONNULL_END
