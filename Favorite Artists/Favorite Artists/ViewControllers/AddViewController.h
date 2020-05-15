//
//  AddViewController.h
//  Favorite Artists
//
//  Created by Mark Gerrior on 5/15/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArtistContoller.h"
#import "MTGArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddViewController : UIViewController

@property ArtistContoller *artistController;
@property MTGArtist *artist;

@end

NS_ASSUME_NONNULL_END
