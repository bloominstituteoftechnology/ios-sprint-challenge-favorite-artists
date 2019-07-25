//
//  MRFArtist+MRFJSONSerialization.h
//  FavoriteArtist
//
//  Created by Michael Flowers on 7/24/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

#import "MRFArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface MRFArtist (MRFJSONSerialization)
    //initializer to initialize your model object from a dictionary
    // -(instance)initWithDictionary:(NSDictionary *)myDictionary;
-(instancetype)initWithDictionary:(NSDictionary *)myDictionary;

    //a function that returns your model object in a dictionary form.
    //-(MRFArtist*)modelObjectFromDictionary:(NSDictionary *)myDictionary;
- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
