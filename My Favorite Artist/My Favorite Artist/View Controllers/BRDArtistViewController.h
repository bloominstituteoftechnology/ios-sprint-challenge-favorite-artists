//
//  BRDArtistViewController.h
//  My Favorite Artist
//
//  Created by Bradley Diroff on 6/12/20.
//  Copyright © 2020 Bradley Diroff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BRDArtistController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BRDArtistViewController : UIViewController

@property (nonatomic, assign) BRDArtistController *artistController;
@property (nonatomic, assign) BRDArtist *artist;

@end

NS_ASSUME_NONNULL_END
