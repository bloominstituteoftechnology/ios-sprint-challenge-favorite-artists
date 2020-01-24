//
//  LSIArtistDetailViewController.h
//  Favorite-Artists
//
//  Created by Percy Ngan on 1/24/20.
//  Copyright © 2020 Lamdba School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSIArtistController;
@class LSIArtist;

@interface LSIArtistDetailViewController : UIViewController <UISearchBarDelegate>

@property LSIArtistController *controller;
@property LSIArtist *artist;

@end


