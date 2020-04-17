//
//  CDGArtistController.h
//  FavoriteArtists
//
//  Created by Chris Gonzales on 4/17/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDGArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface CDGArtistController : NSObject

- (void)searchForArtist:(NSString *)searchTerm completion:(void (^)(CDGArtist *artist, NSError *error))completion;

- (NSArray *)loadFavoriteArtists;

- (void)saveToDirectory:(CDGArtist *)artist;

@end

NS_ASSUME_NONNULL_END
