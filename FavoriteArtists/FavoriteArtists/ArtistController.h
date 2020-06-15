//
//  ArtistController.h
//  FavoriteArtists
//
//  Created by Jessie Ann Griffin on 5/31/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Artist;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistController : NSObject

@property (nonatomic, readonly, copy, nonnull) NSArray<Artist *> *artists;

@property (nonatomic) NSURL *artistListURL;

- (nonnull Artist *)artistAtIndex:(NSInteger)index;

@property (nonatomic, readonly) NSInteger artistCount;

- (void)saveArtistToFavorites:(Artist *)artist;

//- (nullable NSDictionary<NSString *, Artist *> *)initWithContentsOfURL:(NSURL *)url; // this needs to be called on a dictionary but not defined any other way


@end

NS_ASSUME_NONNULL_END
