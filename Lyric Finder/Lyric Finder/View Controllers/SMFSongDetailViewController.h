//
//  SMFSongDetailViewController.h
//  Lyric Finder
//
//  Created by Samantha Gatt on 10/5/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SMFSong;
@class SMFSongController;

NS_ASSUME_NONNULL_BEGIN

@interface SMFSongDetailViewController : UIViewController

@property SMFSong *song;
@property SMFSongController *songController;

@end

NS_ASSUME_NONNULL_END
