//
//  HMRArtistsViewController.h
//  FavoriteArtist
//
//  Created by Harmony Radley on 7/17/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMRArtistController;
@class HMRArtist;

NS_ASSUME_NONNULL_BEGIN

@interface HMRArtistsViewController : UIViewController

@property (nonatomic) HMRArtistController *artistController;
@property (nonatomic) HMRArtist *favoriteArtist;

@end

NS_ASSUME_NONNULL_END
