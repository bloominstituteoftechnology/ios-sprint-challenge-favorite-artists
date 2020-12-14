//
//  ArtistFetcher.h
//  FavoriteArtists
//
//  Created by Craig Belinfante on 11/22/20.
//

#import <Foundation/Foundation.h>
#import "FavoriteArtist.h"

NS_ASSUME_NONNULL_BEGIN

@class FavoriteArtist;

@interface ArtistFetcher : NSObject

@property (nonatomic, copy, readonly) NSArray *artists;

- (void)fetchArtistWithSearchTerm:(nonnull NSString *)searchTerm
completion:(void (^)(FavoriteArtist *,NSError *))completion;

- (void) addArtist:(FavoriteArtist *)artist;

- (void)saveToFileDirectory;
- (void) loadFromFileDirectory;

@end

NS_ASSUME_NONNULL_END
