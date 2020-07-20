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

@interface HMRArtistController : NSObject

@property (nonatomic, readonly) NSArray *favoriteArtists;

- (void)favoriteArtistForName:(NSString *)artist completion:(void(^)(HMRArtist *, NSError *error))completion;

- (void)addArtistWithArtist:(NSString *)artist
                       year:(int)year
                        bio:(NSString *)bio;

- (NSURL *)applicationDocumentsDirectory;

@end

NS_ASSUME_NONNULL_END
