//
//  LAArtist+NSJSONSerialization.h
//  LAFavoriteArtists
//
//  Created by Angel Buenrostro on 4/5/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

#import "LAArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface LAArtist (NSJSONSerialization)

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
-(NSDictionary *)makeArtistDictionary;
@end

NS_ASSUME_NONNULL_END
