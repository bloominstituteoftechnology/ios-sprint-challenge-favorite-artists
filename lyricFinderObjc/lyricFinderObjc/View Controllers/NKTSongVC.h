//
//  NKTSongVC.h
//  lyricFinderObjc
//
//  Created by Nikita Thomas on 1/25/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NKTSong.h"
#import "NKTSongController.h"


NS_ASSUME_NONNULL_BEGIN

@interface NKTSongVC : UIViewController

@property NKTSongController *songController;
@property (nonatomic)NKTSong *song;

@end

NS_ASSUME_NONNULL_END
