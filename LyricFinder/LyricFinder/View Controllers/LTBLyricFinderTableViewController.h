//
//  LTBLyricFinderTableViewController.h
//  LyricFinder
//
//  Created by Linh Bouniol on 10/5/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class LTBLyricController;

NS_ASSUME_NONNULL_BEGIN

@interface LTBLyricFinderTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic) LTBLyricController *lyricController;

@end

NS_ASSUME_NONNULL_END
