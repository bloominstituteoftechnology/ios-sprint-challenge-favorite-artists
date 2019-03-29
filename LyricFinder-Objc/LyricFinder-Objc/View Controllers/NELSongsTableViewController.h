//
//  NELSongsTableViewController.h
//  LyricFinder-Objc
//
//  Created by Nelson Gonzalez on 3/29/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class NELLyricController;

@interface NELSongsTableViewController : UITableViewController

@property (nonatomic) NELLyricController *lyricController;

@end

NS_ASSUME_NONNULL_END
