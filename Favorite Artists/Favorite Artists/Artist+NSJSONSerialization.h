//
//  Artist+NSJSONSerialization.h
//  Favorite Artists
//
//  Created by Michael Stoffer on 11/9/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

#import "Artist.h"

@interface Artist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)toDictionary;

@end
