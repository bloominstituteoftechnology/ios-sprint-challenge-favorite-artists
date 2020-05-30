//
//  DSCArtist+DSCArtist_NSJSONSerialization.h
//  FavoriteArtists
//
//  Created by denis cedeno on 5/29/20.
//  Copyright © 2020 DenCedeno Co. All rights reserved.
//

#import "DSCArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface DSCArtist (DSCArtist_NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
