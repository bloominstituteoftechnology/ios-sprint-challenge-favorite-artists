//
//  MBArtistsTableViewController.h
//  Artists
//
//  Created by Mitchell Budge on 7/19/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBArtist.h"
#import "MBArtistController.h"
#import "MBArtistDetailViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBArtistsTableViewController : UITableViewController

@property MBArtistController *artistController;

@end

NS_ASSUME_NONNULL_END
