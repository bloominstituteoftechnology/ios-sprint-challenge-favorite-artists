//
//  CDGArtist+JSONSerialization.h
//  FavoriteArtists
//
//  Created by Chris Gonzales on 4/20/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDGArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface CDGArtist (NSJSonSerialization)

- (instancetype)initWithDictionary: (NSDictionary *)artistDictionary;

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
