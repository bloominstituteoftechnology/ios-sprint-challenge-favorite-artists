//
//  HHArtist+HHJSONSerialization.h
//  Artist
//
//  Created by Hayden Hastings on 7/19/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

#import "HHArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHArtist (HHJSONSerialization)

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
-(NSDictionary *)makeArtistDictionary;

@end

NS_ASSUME_NONNULL_END
