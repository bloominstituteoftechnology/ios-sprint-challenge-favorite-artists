//
//  VDRArtistSearchViewController.h
//  FavArtists
//
//  Created by Victor  on 7/19/19.
//  Copyright © 2019 Victor . All rights reserved.
//


#import <UIKit/UIKit.h>
#import "VDRArtistController.h"

NS_ASSUME_NONNULL_BEGIN

@interface VDRArtistSearchViewController : UIViewController
@property VDRArtistController *artistController;
@property VDRArtist *searchedArtist;
@end

NS_ASSUME_NONNULL_END
