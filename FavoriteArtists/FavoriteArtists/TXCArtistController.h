//
//  TXCArtistController.h
//  FavoriteArtists
//
//  Created by Thomas Cacciatore on 7/19/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TXCArtistController : NSObject

typedef void (^TXCArtistFetcherCompletionBlock)(NSError *);

@property NSMutableArray *artists;

- (void)fetchArtistWithName:(NSString *)name
            completionBlock:(TXCArtistFetcherCompletionBlock)completionBlock;

@end

NS_ASSUME_NONNULL_END
