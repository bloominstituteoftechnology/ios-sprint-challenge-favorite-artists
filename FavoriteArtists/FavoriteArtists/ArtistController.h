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

//- (nullable NSDictionary<NSString *, Artist *> *)initWithContentsOfURL:(NSURL *)url; // this needs to be called on a dictionary but not defined any other way

- (void)saveArtistToFavorites:(Artist *)artist;

@end

NS_ASSUME_NONNULL_END
