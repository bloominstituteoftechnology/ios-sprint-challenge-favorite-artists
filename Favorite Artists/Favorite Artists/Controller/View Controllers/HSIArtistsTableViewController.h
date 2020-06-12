//
//  HSIArtistsTableViewController.h
//  Favorite Artists
//
//  Created by Kenny on 6/12/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HSIArtistController;

NS_ASSUME_NONNULL_BEGIN

@interface HSIArtistsTableViewController : UITableViewController
//readonly because no other class needs access to it
@property (nonatomic, readonly, copy) HSIArtistController *controller;

@end

NS_ASSUME_NONNULL_END
