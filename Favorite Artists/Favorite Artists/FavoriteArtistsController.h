//
//  FavoriteArtistsController.h
//  Favorite Artists
//
//  Created by David Wright on 6/1/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Artist;

//typedef void(^LoadArtistsCompletionHandler)(NSArray *_Nullable artists, NSError *_Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface FavoriteArtistsController : NSObject

- (instancetype)init;

@property (nonatomic, readonly, copy) NSArray<Artist *> *artists;

- (void)addArtist:(Artist *)artist;

@end

NS_ASSUME_NONNULL_END
