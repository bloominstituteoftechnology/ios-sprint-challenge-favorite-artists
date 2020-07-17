//
//  EJSDetailViewController.h
//  FavoriteArtist
//
//  Created by Enzo Jimenez-Soto on 7/17/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EJSFavoriteArtistController;
@class EJSFavoriteArtist;

NS_ASSUME_NONNULL_BEGIN

@interface EJSDetailViewController : UIViewController

@property (nonatomic) EJSFavoriteArtistController *favoriteArtistController;
@property (nonatomic) EJSFavoriteArtist *favoriteArtist;

@end

NS_ASSUME_NONNULL_END
