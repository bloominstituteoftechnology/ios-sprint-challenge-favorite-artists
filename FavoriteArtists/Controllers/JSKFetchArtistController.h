//
//  JSKFetchArtistController.h
//  FavoriteArtists
//
//  Created by Josh Kocsis on 9/25/20.
//

#import <Foundation/Foundation.h>

typedef void(^ArtistFetcherCompletionHandler)(NSArray *_Nullable artist, NSError *_Nullable error);

NS_ASSUME_NONNULL_BEGIN
@interface JSKFetchArtistController : NSObject

- (void)fetchArtistWithName:(NSString *)artistName fetchArtistWithCompletionHandler:( ArtistFetcherCompletionHandler)completionHandler;

@end
NS_ASSUME_NONNULL_END
