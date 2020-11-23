//
//  ArtistFetcher.h
//  FavoriteArtists
//
//  Created by Craig Belinfante on 11/22/20.
//

#import <Foundation/Foundation.h>
#import "FavoriteArtist.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ArtistFetcherCompletionHandler)(NSArray *_Nullable artists, NSError *_Nullable error);

@interface ArtistFetcher : NSObject

+ (void)fetchArtistWithSearchTerm:(nonnull NSString *)searchTerm
                completionHandler:(nonnull ArtistFetcherCompletionHandler)completionHandler;

@end

NS_ASSUME_NONNULL_END
