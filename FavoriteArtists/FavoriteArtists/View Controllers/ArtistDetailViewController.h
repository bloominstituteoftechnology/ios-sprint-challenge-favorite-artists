//
//  ArtistDetailViewController.h
//  FavoriteArtists
//
//  Created by Nonye on 7/17/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NNEArtistController;
@class NNEArtist;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistDetailViewController : UIViewController<UISearchBarDelegate>

@property (nonatomic) NNEArtistController *nneArtistController;
@property (nonatomic) NNEArtist *nneArtist;

@end

NS_ASSUME_NONNULL_END
