//
//  ArtistDetailViewController.h
//  Favorite Artist
//
//  Created by Gerardo Hernandez on 8/8/20.
//  Copyright © 2020 Gerardo Hernandez. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Artist;
@class FavoriteArtistController;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistDetailViewController : UIViewController

@property (nonatomic, nullable) Artist *artist;
@property (nonatomic, nullable) FavoriteArtistController *favoriteArtistController;
@property (nonatomic) BOOL isShowingFavoriteArtist;

@end

NS_ASSUME_NONNULL_END
