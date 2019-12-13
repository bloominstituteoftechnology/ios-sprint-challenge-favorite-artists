//
//  LSIArtistDetailViewController.h
//  Favorite Artists
//
//  Created by Isaac Lyons on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSIArtistController;
@class LSIArtist;

@interface LSIArtistDetailViewController : UIViewController <UISearchBarDelegate>

@property LSIArtistController *controller;
@property LSIArtist *artist;

@end
