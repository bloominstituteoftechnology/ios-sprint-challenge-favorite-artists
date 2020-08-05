//
//  SMAFavoriteArtistController.h
//  FavoriteArtists
//
//  Created by Sean Acres on 8/5/20.
//  Copyright © 2020 Sean Acres. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMAFavoriteArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface SMAFavoriteArtistController : NSObject

- (void)addArtist:(SMAFavoriteArtist *)artist;

@property (nonatomic) NSArray<SMAFavoriteArtist *> *artists;

@end

NS_ASSUME_NONNULL_END
