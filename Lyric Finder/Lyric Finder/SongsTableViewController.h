//
//  SongsTableViewController.h
//  Lyric Finder
//
//  Created by Sean Hendrix on 1/25/19.
//  Copyright © 2019 Sean Hendrix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SongController.h"
NS_ASSUME_NONNULL_BEGIN

@interface SongsTableViewController : UITableViewController

@property (nonatomic) SongController *songController;

@end

NS_ASSUME_NONNULL_END
