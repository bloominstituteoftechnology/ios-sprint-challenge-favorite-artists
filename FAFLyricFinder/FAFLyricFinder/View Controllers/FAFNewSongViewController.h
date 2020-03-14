//
//  FAFNewSongViewController.h
//  FAFLyricFinder
//
//  Created by Farhan on 11/16/18.
//  Copyright © 2018 Farhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FAFSong.h"
#import "FAFSongController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FAFNewSongViewController : UIViewController

@property FAFSongController *songController;
@property (nonatomic) FAFSong *song;

-(void)updateViews;

@end

NS_ASSUME_NONNULL_END
