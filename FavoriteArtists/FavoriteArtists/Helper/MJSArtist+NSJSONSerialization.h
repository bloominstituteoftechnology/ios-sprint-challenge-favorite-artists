//
//  MJSArtist+NSJSONSerialization.h
//  FavoriteArtists
//
//  Created by Morgan Smith on 9/27/20.
//

#import <Foundation/Foundation.h>
#import "MJSArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface MJSArtist (NSJSONSerialization)

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
