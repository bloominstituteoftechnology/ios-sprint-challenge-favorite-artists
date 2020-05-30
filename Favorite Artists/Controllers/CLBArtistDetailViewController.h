//
//  CLBArtistDetailViewController.h
//  Favorite Artists
//
//  Created by Christian Lorenzo on 5/30/20.
//  Copyright © 2020 Christian Lorenzo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLBArtistsController.h"

NS_ASSUME_NONNULL_BEGIN

@interface CLBArtistDetailViewController : UIViewController

@property (nonatomic, assign) CLBArtistsController *artistController;
@property (nonatomic, assign) CLBArtists *artist;

@end

NS_ASSUME_NONNULL_END
