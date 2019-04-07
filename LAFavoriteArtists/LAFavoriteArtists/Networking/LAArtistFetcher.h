//
//  LAArtistFetcher.h
//  LAFavoriteArtists
//
//  Created by Angel Buenrostro on 4/5/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LAArtist.h"


NS_ASSUME_NONNULL_BEGIN

//typealias
typedef void (^LAArtistFetcherCompletionBlock)(LAArtist *, NSError *);

@interface LAArtistFetcher : NSObject

-(void)fetchArtist:(NSString *)name
   completionBlock:(LAArtistFetcherCompletionBlock)completionBlock;

@end

NS_ASSUME_NONNULL_END
