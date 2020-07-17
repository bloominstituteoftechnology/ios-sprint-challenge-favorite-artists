//
//  DBEArtistController.h
//  FavoriteArtists
//
//  Created by Dahna on 7/17/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBEArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface DBEArtistController : NSObject

- (void)addArtist:(DBEArtist *)artist;

- (DBEArtist *)fetchSavedFavorites:(DBEArtist *)artist;

- (NSMutableArray *)fetchAllFavoriteArtists;

@end

NS_ASSUME_NONNULL_END
