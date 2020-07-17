//
//  ArtistController.h
//  Favorite Artists
//
//  Created by Vincent Hoang on 7/17/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Artist;

NS_ASSUME_NONNULL_BEGIN

typedef void (^ArtistFetcherCompletion)(Artist * _Nullable artist, NSError * _Nullable error);

@interface ArtistController : NSObject

- (void)fetchArtistsByName:(NSString *)name
                completion:(ArtistFetcherCompletion)completion;

- (NSMutableArray *)loadSavedArtists;
- (void)save:(Artist *)artist;

@end

NS_ASSUME_NONNULL_END
