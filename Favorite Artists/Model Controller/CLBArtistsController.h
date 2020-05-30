//
//  CLBArtistsController.h
//  Favorite Artists
//
//  Created by Christian Lorenzo on 5/30/20.
//  Copyright © 2020 Christian Lorenzo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CLBArtists;

typedef void (^ArtistFetchCompletionHandler)(CLBArtists* _Nullable artist, NSError *_Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface CLBArtistsController : NSObject

- (void) fetchArtistsWithName:(NSString *)name completion:(ArtistFetchCompletionHandler)completion;

- (NSArray *)fetchSavedArtists;

@end

NS_ASSUME_NONNULL_END
