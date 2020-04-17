//
//  EPWArtistController.h
//  Favorite-Artists Sprint
//
//  Created by Elizabeth Wingate on 4/17/20.
//  Copyright © 2020 Lambda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EPWArtist+NSJSONSerialization.h"

NS_ASSUME_NONNULL_BEGIN

@class EPWArtist;

@interface EPWArtistController : NSObject

- (void)searchForArtist:(NSString *)searchTerm completion:(void (^)(EPWArtist *artist, NSError *error))completion;

- (NSArray *)fetchFavoritedArtists;

@end

NS_ASSUME_NONNULL_END
