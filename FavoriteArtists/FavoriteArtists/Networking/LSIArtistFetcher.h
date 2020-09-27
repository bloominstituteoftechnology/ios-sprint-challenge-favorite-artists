//
//  LSIArtistFetcher.h
//  FavoriteArtists
//
//  Created by Elizabeth Thomas on 9/27/20.
//

#import <Foundation/Foundation.h>

typedef void(^ArtistFetcherCompletionHandler)(NSArray *_Nullable artists, NSError *_Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface LSIArtistFetcher : NSObject

-(void)fetchArtistsWithName:(NSString *)name
          completionHandler:(ArtistFetcherCompletionHandler)completionHandler;

@end

NS_ASSUME_NONNULL_END
