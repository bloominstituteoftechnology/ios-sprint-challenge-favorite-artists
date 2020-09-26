//
//  ArtistPersistenceController.h
//  FavoriteArtists
//
//  Created by Clayton Watkins on 9/25/20.
//

#import <Foundation/Foundation.h>

@class Artist;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistPersistenceController : NSObject

- (instancetype)init;

@property (nonatomic, readonly, copy) NSArray<Artist *> *artists;

- (void)addArtist:(Artist *)artist;


@end

NS_ASSUME_NONNULL_END
