//
//  LYDArtist+LYDJSONHelper.h
//  LYDFavoriateArtist
//
//  Created by Lydia Zhang on 5/15/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//



#import "LYDArtist.h"

NS_ASSUME_NONNULL_BEGIN

@class LYDArtist;

@interface LYDArtist (LYDJSONHelper)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)toDictionary;


@end

NS_ASSUME_NONNULL_END
