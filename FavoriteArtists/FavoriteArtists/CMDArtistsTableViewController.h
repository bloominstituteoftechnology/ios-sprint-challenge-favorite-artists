//
//  CMDArtistsTableViewController.h
//  FavoriteArtists
//
//  Created by Chris Dobek on 6/12/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class CMDArtistController;

@interface CMDArtistsTableViewController : UITableViewController

@property CMDArtistController* artistController;

@end

NS_ASSUME_NONNULL_END
