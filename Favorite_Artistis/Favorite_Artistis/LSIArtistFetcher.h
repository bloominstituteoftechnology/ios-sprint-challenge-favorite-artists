//
//  LSIArtistFetcher.h
//  Favorite_Artistis
//
//  Created by Joe on 8/3/20.
//  Copyright © 2020 AlphaGradeINC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ArtistFetcherCompletionHandler)(NSArray *_Nullable artists, NSError *_Nullable error);

@interface LSIArtistFetcher : NSObject

- (void)fetchArtistdWithCompletionHandler:(nonnull ArtistFetcherCompletionHandler)completionHandler;
- (void)fetchArtistsInTimeInterval:(nonnull NSDateInterval *)interval completionHandler:(nonnull ArtistFetcherCompletionHandler)completionHandler;

@end

NS_ASSUME_NONNULL_END
