//
//  AMCArtist+NSJSONSerialization.h
//  FavArtist
//
//  Created by Aaron Cleveland on 3/20/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

#import "AMCArtist.h"

@interface AMCArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)toDictionary;

@end

