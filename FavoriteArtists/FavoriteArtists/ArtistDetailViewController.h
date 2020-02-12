//
//  ArtistDetailViewController.h
//  FavoriteArtists
//
//  Created by Bobby Keffury on 2/7/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ArtistController;
@class Artist;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistDetailViewController : UIViewController

@property (nonatomic) ArtistController *artistController;
@property (nonatomic) Artist *artist;

@end

NS_ASSUME_NONNULL_END
