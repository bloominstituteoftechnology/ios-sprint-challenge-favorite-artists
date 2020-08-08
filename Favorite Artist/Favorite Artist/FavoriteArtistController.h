//
//  FavoriteArtistController.h
//  Favorite Artist
//
//  Created by Gerardo Hernandez on 8/8/20.
//  Copyright © 2020 Gerardo Hernandez. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Artist;

NS_ASSUME_NONNULL_BEGIN

@interface FavoriteArtistController : NSObject

- (instancetype)init;

@property (nonatomic, readonly, copy) NSArray<Artist *> *artist;

- (void)addArtist:(Artist *)artist;
- (void)deleteArtist:(Artist *)artist;

@end

NS_ASSUME_NONNULL_END
