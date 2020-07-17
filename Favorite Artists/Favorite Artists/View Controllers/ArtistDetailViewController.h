//
//  ArtistDetailViewController.h
//  Favorite Artists
//
//  Created by Vincent Hoang on 7/17/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArtistController.h"

@class Artist;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistDetailViewController : UIViewController

@property (nonatomic, nullable) Artist *artist;
@property (nonatomic, strong) ArtistController *controller;

@end

NS_ASSUME_NONNULL_END
