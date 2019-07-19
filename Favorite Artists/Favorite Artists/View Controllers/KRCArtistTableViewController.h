//
//  KRCArtistTableViewController.h
//  Favorite Artists
//
//  Created by Christopher Aronson on 7/19/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class KRCArtistController;
@class KRCArtist;

@interface KRCArtistTableViewController : UITableViewController

@property KRCArtistController *artistController;
@property KRCArtist *artist;

@end

NS_ASSUME_NONNULL_END
