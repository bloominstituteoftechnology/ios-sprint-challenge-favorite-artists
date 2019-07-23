//
//  LSIArtistTableViewController.h
//  FaveArtists
//
//  Created by John Pitts on 7/19/19.
//  Copyright © 2019 johnpitts. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LSIArtistController;

@interface LSIArtistTableViewController : UITableViewController

@property (nonatomic) LSIArtistController *artistController;

@end

NS_ASSUME_NONNULL_END
