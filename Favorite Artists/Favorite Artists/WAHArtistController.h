//
//  WAHArtistController.h
//  Favorite Artists
//
//  Created by Wyatt Harrell on 5/15/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WAHArtist;

typedef void (^WAHArtistFetcherCompletion)(WAHArtist * _Nullable artist, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface WAHArtistController : NSObject

- (void)fetchArtistWithName:(NSString *)name
            completionBlock:(WAHArtistFetcherCompletion)completionBlock;

@end

NS_ASSUME_NONNULL_END
