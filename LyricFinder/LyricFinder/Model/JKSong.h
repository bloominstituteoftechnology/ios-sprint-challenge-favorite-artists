//
//  JKSong.h
//  LyricFinder
//
//  Created by TuneUp Shop  on 3/1/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSNumber *ratingStepperValue;

@interface JKSong : NSObject

@property (nonatomic, copy) NSString *songTitle;
@property (nonatomic, copy) NSString *artistName;
@property (nonatomic, copy) NSString *songLyrics;
@property (nonatomic)NSNumber *jKSongRating;



@end


