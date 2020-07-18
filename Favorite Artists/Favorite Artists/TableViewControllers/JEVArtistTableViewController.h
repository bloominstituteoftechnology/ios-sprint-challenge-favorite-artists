//
//  JEVArtistTableViewController.h
//  Favorite Artists
//
//  Created by Joe Veverka on 7/18/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JEVArtistController;

NS_ASSUME_NONNULL_BEGIN

@interface JEVArtistTableViewController : UITableViewController

//MARK: - Properties

/// No one else needs access
@property (nonatomic, readonly, copy) JEVArtistController *controller;

@end

NS_ASSUME_NONNULL_END
