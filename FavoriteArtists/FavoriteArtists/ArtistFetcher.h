//
//  ArtistFetcher.h
//  FavoriteArtists
//
//  Created by Sean Acres on 8/2/20.
//  Copyright © 2020 Sean Acres. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ArtistFetcherCompletionHandler)(NSArray *_Nullable artists, NSError *_Nullable error);

@interface ArtistFetcher : NSObject

- (void)fetchArtistsWithCompletionHandler:(nonnull ArtistFetcherCompletionHandler)completionHandler;

- (void)fetchArtistsWithArtistName:(nonnull NSString *)artistName
                 completionHandler:(nonnull ArtistFetcherCompletionHandler)completionHandler;

@end

