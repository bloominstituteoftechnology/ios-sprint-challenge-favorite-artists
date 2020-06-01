//
//  ArtistController.h
//  FavoriteArtists
//
//  Created by Jessie Ann Griffin on 5/31/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Artist.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArtistController : NSObject

@property (nonatomic) NSMutableArray<Artist *> *artists;

@property (nonatomic) NSURL *artistListURL;

//- (nullable NSDictionary<NSString *, Artist *> *)initWithContentsOfURL:(NSURL *)url API_DEPRECATED_WITH_REPLACEMENT("initWithContentsOfURL:error:", macos(10.0, API_TO_BE_DEPRECATED), ios(2.0, API_TO_BE_DEPRECATED), watchos(2.0, API_TO_BE_DEPRECATED), tvos(9.0, API_TO_BE_DEPRECATED));

- (void)saveArtistToFavorites:(Artist *)artist;

@end

NS_ASSUME_NONNULL_END
