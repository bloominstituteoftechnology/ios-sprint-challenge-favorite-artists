//
//  JEVArtist+JSONSerialization.h
//  Favorite Artists
//
//  Created by Joe Veverka on 7/18/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JEVArtist.h"

NS_ASSUME_NONNULL_BEGIN
@interface JEVArtist (NSJSONSerialiazation)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)createArtistDictionary;

@end



NS_ASSUME_NONNULL_END
