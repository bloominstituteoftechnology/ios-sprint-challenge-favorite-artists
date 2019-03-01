//
//  BHSearchNetworkController.h
//  LyricFinder
//
//  Created by Benjamin Hakes on 3/1/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BHSearchNetworkController : NSObject

@property NSMutableArray *songs;

- (void)searchForSongLyrics:(NSString *)artist for:(NSString *)song completion:(void (^)(NSMutableArray *forecastsFromZipcode, NSError *))completion;

@end

NS_ASSUME_NONNULL_END
