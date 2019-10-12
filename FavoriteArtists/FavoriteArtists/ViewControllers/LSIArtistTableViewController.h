//
//  LSIArtistTableViewController.h
//  FavoriteArtists
//
//  Created by Luqmaan Khan on 10/11/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSIArtistController;
@class LSIArtist;
@interface LSIArtistTableViewController : UITableViewController
@property LSIArtist *artist;
@property (nonatomic)LSIArtistController *controller;

@end

