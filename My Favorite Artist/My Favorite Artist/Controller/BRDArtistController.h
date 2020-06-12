//
//  BRDArtistController.h
//  My Favorite Artist
//
//  Created by Bradley Diroff on 6/12/20.
//  Copyright © 2020 Bradley Diroff. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BRDArtist;

typedef void (^BRDArtistFetcherCompletion)(BRDArtist * _Nullable artist, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface BRDArtistController : NSObject

- (void)fetchArtistWithName:(NSString *)name
            completionBlock:(BRDArtistFetcherCompletion)completionBlock;

- (NSArray *)fetchSavedArtists;

@end

NS_ASSUME_NONNULL_END
