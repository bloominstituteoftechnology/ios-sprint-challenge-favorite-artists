//
//  LSILyricFInderViewController.h
//  LSILyric FInder
//
//  Created by Iyin Raphael on 3/8/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSILyricsController.h"
#import "LSILyric.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSILyricFInderViewController : UIViewController
@property LSILyricsController *lyricsController;
@property LSILyric *song;

@end

NS_ASSUME_NONNULL_END
