//
//  AddViewController.h
//  Favorite Artists
//
//  Created by Mark Gerrior on 5/15/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArtistController.h"
#import "MTGArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddViewController : UIViewController

@property ArtistController *artistController;
@property MTGArtist *artist;
@property BOOL foundArtist;

@end

NS_ASSUME_NONNULL_END
