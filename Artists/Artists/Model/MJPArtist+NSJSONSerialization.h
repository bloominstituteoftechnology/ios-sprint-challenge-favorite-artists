//
//  MJPArtist+NSJSONSerialization.h
//  Artists
//
//  Created by Mark Poggi on 6/12/20.
//  Copyright © 2020 Mark Poggi. All rights reserved.
//

#import "MJPArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface MJPArtist (NSJSONSerialization)

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
-(NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
