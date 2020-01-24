//
//  LSIArtistsTableViewController.h
//  Favorite Artists
//
//  Created by macbook on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSIArtistController;

NS_ASSUME_NONNULL_BEGIN

@interface LSIArtistsTableViewController : UITableViewController

@property (nonatomic, copy) LSIArtistController *artistController;

@end

NS_ASSUME_NONNULL_END
