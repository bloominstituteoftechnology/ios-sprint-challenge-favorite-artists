//
//  MBMArtist+NSJSONSerialization.h
//  FavoriteArtists
//
//  Created by Michael on 3/20/20.
//  Copyright © 2020 Michael. All rights reserved.
//

#import "MBMArtist.h"


NS_ASSUME_NONNULL_BEGIN

@interface MBMArtist (NSJSONSerialization)

-(instancetype)initWithDictionary:(NSMutableDictionary *)dictionary;

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
