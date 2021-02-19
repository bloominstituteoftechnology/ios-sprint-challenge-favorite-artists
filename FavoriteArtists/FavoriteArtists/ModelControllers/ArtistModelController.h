//
//  ArtistModelController.h
//  FavoriteArtists
//
//  Created by John McCants on 2/18/21.
//

#import <Foundation/Foundation.h>
#import "Artist.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^ArtistCompletion)(Artist *artist, NSError *error);

@interface ArtistModelController : NSObject

@property (nonatomic, readonly, copy, nullable) NSMutableArray<Artist *> *artists;

+(void)fetchArtist:(nonnull NSString *)searchTerm
          completionHandler:(nonnull ArtistCompletion)completionHandler;

- (void)saveToPersistentStore;

- (void)loadFromPersistentStore;

@end

NS_ASSUME_NONNULL_END
