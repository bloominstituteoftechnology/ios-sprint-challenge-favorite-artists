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
typedef void (^LAArtistFetcherCompletionBlock)(NSArray *, NSError *);
// ******* MAY NEED TO CHANGE NSARRAY HERE TO NSDICTIONARY FIRST

@interface LAArtistFetcher : NSObject

-(void)fetchArtist:(NSString *)name
//   completionBlock:(void (^)(NSArray *, NSError *))completionBlock;
   completionBlock:(LAArtistFetcherCompletionBlock)completionBlock;

@end

NS_ASSUME_NONNULL_END
