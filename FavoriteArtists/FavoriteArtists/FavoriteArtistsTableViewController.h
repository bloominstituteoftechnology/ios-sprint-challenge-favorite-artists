//
//  FavoriteArtistsTableViewController.h
//  FavoriteArtists
//
//  Created by Jessie Ann Griffin on 5/29/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class Artist;
@class ArtistController;

@interface FavoriteArtistsTableViewController : UITableViewController

@property ArtistController *artistController;

@end

NS_ASSUME_NONNULL_END
