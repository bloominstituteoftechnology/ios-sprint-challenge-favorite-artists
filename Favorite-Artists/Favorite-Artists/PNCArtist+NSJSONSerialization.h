//
//  PNCArtist+NSJSONSerialization.h
//  Favorite-Artists
//
//  Created by Percy Ngan on 1/24/20.
//  Copyright © 2020 Lamdba School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PNCArtist.h"

@interface PNCArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (instancetype)initWithFileDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

@end


