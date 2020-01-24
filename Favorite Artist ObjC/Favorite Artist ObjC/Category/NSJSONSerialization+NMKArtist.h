//
//  NSJSONSerialization+NMKArtist.h
//  Favorite Artist ObjC
//
//  Created by Niranjan Kumar on 1/24/20.
//  Copyright © 2020 Nar Kumar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NMKArtist.h"

@interface NMKArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

@end

