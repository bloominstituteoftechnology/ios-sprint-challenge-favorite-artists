//
//  JKSong.h
//  LyricFinder
//
//  Created by TuneUp Shop  on 3/1/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JKSong : NSObject

@property NSString *songTitle;
@property NSString *artistName;
@property NSString *songLyrics;
@property NSInteger *songRating;

@end

NS_ASSUME_NONNULL_END
