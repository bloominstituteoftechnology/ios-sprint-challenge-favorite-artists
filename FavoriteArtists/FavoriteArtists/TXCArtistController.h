//
//  TXCArtistController.h
//  FavoriteArtists
//
//  Created by Thomas Cacciatore on 7/19/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^TXCArtistFetcherCompletionBlock)(NSArray *artists, NSError *error);

@interface TXCArtistController : NSObject


@property  NSMutableArray *artists;
- (void)fetchArtistWithName:(NSString *)name
            completionBlock:(TXCArtistFetcherCompletionBlock)completionBlock;

// functions that save artists to persistent store/load from persistent store.
//- (void)saveToPersistentStore;

@end

NS_ASSUME_NONNULL_END
