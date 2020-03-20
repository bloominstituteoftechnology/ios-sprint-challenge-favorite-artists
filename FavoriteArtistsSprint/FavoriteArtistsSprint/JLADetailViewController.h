//
//  JLADetailViewController.h
//  FavoriteArtistsSprint
//
//  Created by Jorge Alvarez on 3/20/20.
//  Copyright © 2020 Jorge Alvarez. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JLAFavoriteArtistController;
@class JLAFavoriteArtist;

NS_ASSUME_NONNULL_BEGIN

@interface JLADetailViewController : UIViewController

@property (nonatomic) JLAFavoriteArtistController *favoriteArtistController;
@property (nonatomic) JLAFavoriteArtist *favoriteArtist;

@end

NS_ASSUME_NONNULL_END
