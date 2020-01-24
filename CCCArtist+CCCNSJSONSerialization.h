//
//  CCCArtist+CCCNSJSONSerialization.h
//  ios-sprint-challenge-favorite-artists
//
//  Created by Jonalynn Masters on 1/24/20.
//  Copyright © 2020 Jonalynn Masters. All rights reserved.
//

#import "CCCArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface CCCArtist (CCCNSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)createArtistDictionary;

@end

NS_ASSUME_NONNULL_END
