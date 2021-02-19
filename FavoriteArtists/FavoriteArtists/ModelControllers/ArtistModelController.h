//
//  ArtistModelController.h
//  FavoriteArtists
//
//  Created by John McCants on 2/18/21.
//

#import <Foundation/Foundation.h>
#import "Artist.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^ArtistCompletionHandler)(Artist *_Nullable artist, NSError *_Nullable error);

@interface ArtistModelController : NSObject

@property (nonatomic, readonly, copy, nullable) NSMutableArray<Artist *> *artists;

+(void)searchWithSearchTerm:(nonnull NSString *)searchTerm
          completionHandler:(nonnull ArtistCompletionHandler)completionHandler;

- (void)saveToPersistentStore;

- (void)loadFromPersistentStore;

@end

NS_ASSUME_NONNULL_END
