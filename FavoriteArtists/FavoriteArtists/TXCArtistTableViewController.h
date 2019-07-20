//
//  TXCArtistTableViewController.h
//  FavoriteArtists
//
//  Created by Thomas Cacciatore on 7/19/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class TXCArtistController;

@interface TXCArtistTableViewController : UITableViewController

@property (nonatomic) TXCArtistController *artistController;

@end

NS_ASSUME_NONNULL_END
