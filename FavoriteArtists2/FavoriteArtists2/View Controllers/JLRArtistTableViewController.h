//
//  JLRArtistTableViewController.h
//  FavoriteArtists2
//
//  Created by Jesse Ruiz on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JLRFavoriteArtist2Controller;

NS_ASSUME_NONNULL_BEGIN

@interface JLRArtistTableViewController : UITableViewController <UISearchBarDelegate>

@property (nonatomic, copy) JLRFavoriteArtist2Controller *artistController;

@end

NS_ASSUME_NONNULL_END
