//
//  LSIArtistsTableViewController.h
//  FavoriteArtists
//
//  Created by Alex on 7/19/19.
//  Copyright © 2019 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class LSIArtistController;

@interface LSIArtistsTableViewController : UITableViewController

@property (nonatomic) LSIArtistController *artistController;

@end

NS_ASSUME_NONNULL_END
