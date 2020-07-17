//
//  NNEArtistTableViewController.h
//  FavoriteArtists
//
//  Created by Nonye on 7/17/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NNEArtistController;

NS_ASSUME_NONNULL_BEGIN

@interface NNEArtistTableViewController : UITableViewController

@property (nonatomic) NNEArtistController *artistController;

@end

NS_ASSUME_NONNULL_END
