//
//  JKSongDetailViewController.h
//  LyricFinder
//
//  Created by TuneUp Shop  on 3/1/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKLyricFinderController.h"
#import "NSDictionary+NSJSONSerialization.h"



NS_ASSUME_NONNULL_BEGIN
@interface JKSongDetailViewController : UIViewController

@property (nonatomic, strong, nullable) JKSong *song;
@property (nonatomic, strong) JKLyricFinderController *lyricFinderController;

@end

NS_ASSUME_NONNULL_END

