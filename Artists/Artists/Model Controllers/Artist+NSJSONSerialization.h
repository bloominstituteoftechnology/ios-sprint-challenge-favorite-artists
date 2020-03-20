//
//  Artist+NSJSONSerialization.h
//  Artists
//
//  Created by Alexander Supe on 20.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

#import "Artist.h"

NS_ASSUME_NONNULL_BEGIN

@interface Artist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
