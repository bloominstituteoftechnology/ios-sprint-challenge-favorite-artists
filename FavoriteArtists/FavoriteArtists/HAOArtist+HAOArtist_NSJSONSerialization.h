//
//  HAOArtist+HAOArtist_NSJSONSerialization.h
//  FavoriteArtists
//
//  Created by Hunter Oppel on 6/12/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

#import "HAOArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface HAOArtist (HAOArtist_NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

//- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
