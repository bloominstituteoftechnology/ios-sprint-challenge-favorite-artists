//
//  ArtistDetailViewController.h
//  FavoriteArtists
//
//  Created by Sean Acres on 8/2/20.
//  Copyright © 2020 Sean Acres. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMAFavoriteArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArtistDetailViewController : UIViewController

@property (nonatomic) SMAFavoriteArtist *favoriteArtist;

@end

NS_ASSUME_NONNULL_END
