//
//  ArtistDetailViewController.h
//  FavoriteArtists
//
//  Created by Chris Gonzales on 4/17/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDGArtistController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArtistDetailViewController : UIViewController <UISearchBarDelegate>

- (void)updateViews;

@end

NS_ASSUME_NONNULL_END
