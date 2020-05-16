//
//  MTGArtistFetcher.h
//  Favorite Artists
//
//  Created by Mark Gerrior on 5/15/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

#ifndef MTGArtistFetcher_h
#define MTGArtistFetcher_h

// Forward class declaration
@class MTGArtist;

typedef void (^MTGArtistFetcherCompletion)(MTGArtist * _Nullable artists, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface MTGArtistFetcher : NSObject

- (void)fetchArtistByName:(NSString *)searchName
                  completionBlock:(MTGArtistFetcherCompletion)completionBlock;

@end

NS_ASSUME_NONNULL_END

#endif /* MTGArtistFetcher_h */
