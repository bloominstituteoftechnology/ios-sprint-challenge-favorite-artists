//
//  ArtistController.h
//  FavoriteArtists
//
//  Created by Matthew Martindale on 8/2/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Artist;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistController : NSObject

@property (nonatomic, readonly, copy) NSArray<Artist *> *artists;

- (instancetype)init;
- (void)addArtist:(Artist *)artist;

@end

NS_ASSUME_NONNULL_END
