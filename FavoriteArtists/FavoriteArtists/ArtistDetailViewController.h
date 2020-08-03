//
//  ArtistDetailViewController.h
//  FavoriteArtists
//
//  Created by Kelson Hartle on 8/2/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSIArtistController;
@class LSIArtist;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistDetailViewController : UIViewController

@property LSIArtistController *fetcher;
@property LSIArtist *artist;

@end

NS_ASSUME_NONNULL_END
