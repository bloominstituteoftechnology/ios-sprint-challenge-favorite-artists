//
//  MJRSongDetailViewController.h
//  Lyric Finder
//
//  Created by Moses Robinson on 3/29/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MJRSongController;
@class MJRSong;

NS_ASSUME_NONNULL_BEGIN

@interface MJRSongDetailViewController : UIViewController

@property (nonatomic) MJRSongController *songController;
@property (nonatomic) MJRSong *song;

@end

NS_ASSUME_NONNULL_END
