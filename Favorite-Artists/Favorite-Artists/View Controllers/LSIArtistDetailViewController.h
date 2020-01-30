//
//  LSIArtistDetailViewController.h
//  Favorite-Artists
//
//  Created by Percy Ngan on 1/24/20.
//  Copyright © 2020 Lamdba School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PNCArtistController;
@class PNCArtist;

@interface LSIArtistDetailViewController : UIViewController <UISearchBarDelegate>

@property PNCArtistController *controller;
@property PNCArtist *artist;

@end


