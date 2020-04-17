//
//  SAHArtistFetcher.h
//  Favorite Artists
//
//  Created by scott harris on 4/17/20.
//  Copyright © 2020 scott harris. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SAHArtist;
typedef void (^SAHArtistFetcherCompletionBlock)(SAHArtist * _Nullable artist, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface SAHArtistFetcher : NSObject

- (void)fetchArtistWithName:(NSString *)name completionBlock:(SAHArtistFetcherCompletionBlock)completionBlock;

@end

NS_ASSUME_NONNULL_END
