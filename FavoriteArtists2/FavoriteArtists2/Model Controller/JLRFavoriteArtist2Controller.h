//
//  JLRFavoriteArtist2Controller.h
//  FavoriteArtists2
//
//  Created by Jesse Ruiz on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Artist;

NS_ASSUME_NONNULL_BEGIN

@interface JLRFavoriteArtist2Controller : NSObject

- (void)searchForArtistsWithSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray *artists, NSError *error))completion;

- (Artist *)createFavoriteArtistWithName:(NSString *)name bio:(NSString *)bio formed:(NSDate *)formed;
- (void)deleteArtist:(Artist *)artist;

@property (nonatomic, copy, readonly) NSArray *artists;

@end

NS_ASSUME_NONNULL_END
