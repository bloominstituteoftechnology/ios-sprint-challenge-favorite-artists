//
//  HMRArtistController.h
//  FavoriteArtist
//
//  Created by Harmony Radley on 7/17/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class HMRArtist;

typedef void (^CompletionHandler)(HMRArtist * _Nullable artist, NSError * _Nullable error);

@interface HMRArtistController : NSObject

- (void)fetchArtistName:(NSString *)name
      completionHandler:(CompletionHandler)completionHandler;

-  (NSMutableArray *)fetchSavedArtist;

@end

NS_ASSUME_NONNULL_END
