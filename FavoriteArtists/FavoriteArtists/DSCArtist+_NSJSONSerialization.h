//
//  DSCArtist+_NSJSONSerialization.h
//  FavoriteArtists
//
//  Created by denis cedeno on 5/30/20.
//  Copyright © 2020 DenCedeno Co. All rights reserved.
//

#import "DSCArtist.h"
@class DSCArtist;

NS_ASSUME_NONNULL_BEGIN

@interface DSCArtist (_NSJSONSerialization)


- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)toDictionary;



@end

NS_ASSUME_NONNULL_END
