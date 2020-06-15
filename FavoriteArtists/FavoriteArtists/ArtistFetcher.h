//
//  ArtistFetcher.h
//  FavoriteArtists
//
//  Created by Jessie Ann Griffin on 5/29/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Artist.h"
#import "Artist+NSJSONSerialization.h"

typedef void(^ArtistFetcherCompletionHandler)(Artist * _Nullable artist, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface ArtistFetcher : NSObject

- (void)fetchArtistWithName:(NSString *)name
          completionHandler:(nonnull ArtistFetcherCompletionHandler)completionHandler;

@end

NS_ASSUME_NONNULL_END
