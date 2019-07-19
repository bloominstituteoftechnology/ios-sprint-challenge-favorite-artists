//
//  HSVArtist+NSIJsonSerialization.h
//  Artists
//
//  Created by Hector Steven on 7/19/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

#import "HSVArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface HSVArtist (NSIJsonSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
