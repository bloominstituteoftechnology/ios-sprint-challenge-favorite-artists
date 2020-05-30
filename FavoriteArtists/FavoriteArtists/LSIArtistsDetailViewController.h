//
//  ArtistsViewController.h
//  FavoriteArtists
//
//  Created by Alex Thompson on 5/30/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSIArtistsController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSIArtistsDetailViewController : UIViewController

@property (nonatomic, assign) LSIArtistsController *artistController;
@property (nonatomic, assign) LSIArtists *artist;

@end

NS_ASSUME_NONNULL_END
