//
//  ArtistsController.h
//  FavoriteArtists
//
//  Created by Claudia Maciel on 7/31/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Artist.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArtistsController : NSObject

@property (nonatomic, readonly, copy) NSArray<Artist *> *artists;

- (instancetype)init;

- (void)addArtist:(Artist *)artist;

@end

NS_ASSUME_NONNULL_END
