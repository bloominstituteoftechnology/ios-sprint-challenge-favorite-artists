//
//  DYPSongDetailViewController.h
//  LyricFinder
//
//  Created by Daniela Parra on 11/16/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DYPSong;
@class DYPSongController;

NS_ASSUME_NONNULL_BEGIN

@interface DYPSongDetailViewController : UIViewController

@property (nonatomic) DYPSong *song;
@property (nonatomic) DYPSongController *songController;

@end

NS_ASSUME_NONNULL_END
