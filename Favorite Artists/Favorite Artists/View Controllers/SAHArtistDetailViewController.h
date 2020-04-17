//
//  SAHArtistDetailViewController.h
//  Favorite Artists
//
//  Created by scott harris on 4/17/20.
//  Copyright © 2020 scott harris. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SAHArtistController;
@class SAHArtist;

NS_ASSUME_NONNULL_BEGIN

@interface SAHArtistDetailViewController : UIViewController

@property (nonatomic) SAHArtistController *artistController;
@property (nonatomic) SAHArtist *artist;

@end

NS_ASSUME_NONNULL_END
