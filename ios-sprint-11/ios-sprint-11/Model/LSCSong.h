//
//  LSCSong.h
//  ios-sprint-11
//
//  Created by David Doswell on 10/5/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSCSong : NSObject

// set model objects and instance type
- (instancetype)initWithSongTitle:(NSString *)songTitle artistName:(NSString *)artistName songLyrics:(NSString *)songLyrics songRating:(NSInteger)songRating;

@property NSString *songTitle;
@property NSString *artistName;
@property NSString *songLyrics;
@property NSInteger *songRating;

@end

NS_ASSUME_NONNULL_END
