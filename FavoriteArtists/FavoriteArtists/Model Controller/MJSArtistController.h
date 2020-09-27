//
//  MJSArtistController.h
//  FavoriteArtists
//
//  Created by Morgan Smith on 9/27/20.
//

#import <Foundation/Foundation.h>

@class MJSArtist;

typedef void (^ArtistFetchCompletionHandler)(MJSArtist* _Nullable artist, NSError *_Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface MJSArtistController : NSObject

- (void) fetchArtistsWithName:(NSString *)name completion:(ArtistFetchCompletionHandler)completion;

- (NSArray *)fetchSavedArtists;

@end

NS_ASSUME_NONNULL_END
