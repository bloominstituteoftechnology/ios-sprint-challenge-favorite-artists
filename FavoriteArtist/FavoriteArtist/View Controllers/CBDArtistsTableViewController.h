//
//  CBDArtistsTableViewController.h
//  FavoriteArtist
//
//  Created by Christopher Devito on 5/15/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CBDArtistFetcher;
@class CBDArtist;
@class CBDDetailViewController;

NS_ASSUME_NONNULL_BEGIN

@interface CBDArtistsTableViewController : UITableViewController

@property (nonatomic, nullable) CBDArtistFetcher *fetcher;

@end

NS_ASSUME_NONNULL_END
