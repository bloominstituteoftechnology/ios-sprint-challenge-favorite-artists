//
//  CBDDetailViewController.h
//  FavoriteArtist
//
//  Created by Christopher Devito on 5/15/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CBDArtistFetcher;
@class CBDArtist;
@class CBDArtistsTableViewController;

NS_ASSUME_NONNULL_BEGIN

@interface CBDDetailViewController : UIViewController<UISearchBarDelegate>

@property (nonatomic, nullable) CBDArtistFetcher *fetcher;
@property (nonatomic, nullable) CBDArtist *artist;

@end

NS_ASSUME_NONNULL_END
