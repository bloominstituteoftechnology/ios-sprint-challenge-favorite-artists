//
//  MyArtist+NSJSONSerialization.h
//  FavoriteArtists
//
//  Created by Gladymir Philippe on 11/22/20.
//

#import <Foundation/Foundation.h>
#import "MyArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyArtist (NSJSONSerialization)

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
