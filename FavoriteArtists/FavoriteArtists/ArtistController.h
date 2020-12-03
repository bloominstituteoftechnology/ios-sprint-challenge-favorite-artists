//
//  ArtistController.h
//  FavoriteArtists
//
//  Created by Bohdan Tkachenko on 11/30/20.
//

#import <Foundation/Foundation.h>
#import "Artist.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ArtistControllerCompletionHandler)(Artist *_Nullable artist, NSError *_Nullable error);

@interface ArtistController : NSObject

@property (nonatomic, readonly, copy, nullable) NSMutableArray<Artist *> *artists;

+ (void)searchArtistsWithSearchTerm:(nonnull NSString *)searchTerm
                completionHandler:(nonnull ArtistControllerCompletionHandler)completionHandler;

- (void)saveToPersistentStore;

- (void)loadFromPersistentStore;

@end

NS_ASSUME_NONNULL_END
