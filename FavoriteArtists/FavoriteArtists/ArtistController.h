//
//  ArtistController.h
//  FavoriteArtists
//
//  Created by Jessie Ann Griffin on 5/31/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Artist;

@interface ArtistController : NSObject

- (nonnull Artist *)artistAtIndex:(NSInteger)index;

@property (nonatomic, readonly) NSInteger artistCount;

- (void)saveArtistToFavorites:(Artist *)artist;
- (void)saveToPersistentStore;
- (void)loadFromPersistentStore;

@end

NS_ASSUME_NONNULL_END
