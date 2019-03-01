//
//  JKSong.h
//  LyricFinder
//
//  Created by TuneUp Shop  on 3/1/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKSongDetailViewController.h"



@interface JKSong : NSObject

@property (nonatomic, copy) NSString *songTitle;
@property (nonatomic, copy) NSString *artistName;
@property (nonatomic, copy) NSString *songLyrics;
@property double *songRating;
extern double stepperValue;

- (instancetype)initWithSongTitle: (NSString *)songTitle andArtistName: (NSString *)artistName andSongLyrics: (NSString *)songLyrics andSongRating: (double)songRating;

@end


