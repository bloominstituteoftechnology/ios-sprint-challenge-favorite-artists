//
//  DLJJSONSerialization.h
//  FavoriteArtistApp
//
//  Created by Diante Lewis-Jolley on 7/19/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

#import "DLJArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface DLJArtist (NSJSONSerialization)

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)artistDictionary;

@end

NS_ASSUME_NONNULL_END
