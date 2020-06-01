//
//  ArtistFetcher.h
//  Favorite Artists
//
//  Created by David Wright on 5/31/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ArtistFetcherCompletionHandler)(NSArray *_Nullable artists, NSError *_Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface ArtistFetcher : NSObject

- (void)fetchArtistsWithName:(NSString *)name
           completionHandler:(ArtistFetcherCompletionHandler)completionHandler;

@end

NS_ASSUME_NONNULL_END
