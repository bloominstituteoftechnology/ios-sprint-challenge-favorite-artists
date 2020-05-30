//
//  LSIArtistsController.h
//  FavoriteArtists
//
//  Created by Alex Thompson on 5/30/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSIArtists;

typedef void (^ArtistFetcherCompletionHandler)(LSIArtists* _Nullable artist, NSError *_Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface LSIArtistsController : NSObject

- (void) fetchArtistWithName:(NSString *)name completion:(ArtistFetcherCompletionHandler)completion;

- (NSArray *)fetchSavedArtists;

@end

NS_ASSUME_NONNULL_END
