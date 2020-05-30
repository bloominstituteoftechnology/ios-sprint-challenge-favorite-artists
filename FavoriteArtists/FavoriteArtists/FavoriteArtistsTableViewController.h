//
//  FavoriteArtistsTableViewController.h
//  FavoriteArtists
//
//  Created by Jessie Ann Griffin on 5/29/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Artist.h"

NS_ASSUME_NONNULL_BEGIN

@interface FavoriteArtistsTableViewController : UITableViewController

@property (nonatomic) NSArray<Artist *> *artists;

@end

NS_ASSUME_NONNULL_END
