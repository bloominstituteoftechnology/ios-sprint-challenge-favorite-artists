//
//  DYPSongController.h
//  LyricFinder
//
//  Created by Daniela Parra on 11/16/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DYPSong;

NS_ASSUME_NONNULL_BEGIN

@interface DYPSongController : NSObject

- (void)addASongWithTitle:(NSString *)title artistName:(NSString *)artistName lyrics:(NSString *)lyrics rating:(NSInteger)rating;

- (void)searchLyricsForSongTitle:(NSString *)title artistName:(NSString *)artistName completion:(void (^)(NSString * _Nullable lyrics, NSError * _Nullable error))completion;

@property (nonatomic, readonly) NSArray *songs;

@end

NS_ASSUME_NONNULL_END
