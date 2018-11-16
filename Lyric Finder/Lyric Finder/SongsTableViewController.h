//
//  SongsTableViewController.h
//  Lyric Finder
//
//  Created by Moin Uddin on 11/16/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SongController.h"
NS_ASSUME_NONNULL_BEGIN

@interface SongsTableViewController : UITableViewController

@property (nonatomic) SongController *songController;

@end

NS_ASSUME_NONNULL_END
