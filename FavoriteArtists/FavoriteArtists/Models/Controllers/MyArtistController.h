//
//  MyArtistController.h
//  FavoriteArtists
//
//  Created by Gladymir Philippe on 11/22/20.
//

#import <Foundation/Foundation.h>

@class MyArtist;

typedef void (^ArtistFetchCompletionHandler)(MyArtist* _Nullable artist, NSError *_Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface MyArtistController : NSObject

- (void) fetchArtistsWithName:(NSString *)name completion:(ArtistFetchCompletionHandler)completion;

- (NSArray *)fetchSaveArtists;

@end

NS_ASSUME_NONNULL_END
