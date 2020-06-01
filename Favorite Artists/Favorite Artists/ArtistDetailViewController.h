//
//  ArtistDetailViewController.h
//  Favorite Artists
//
//  Created by David Wright on 5/31/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Artist;
@class FavoriteArtistsController;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistDetailViewController : UIViewController

@property (nonatomic, nullable) Artist *artist;
@property (nonatomic, nullable) FavoriteArtistsController *favoriteArtistsController;
@property (nonatomic) BOOL isShowingFavoriteArtistDetail;

@end

NS_ASSUME_NONNULL_END
