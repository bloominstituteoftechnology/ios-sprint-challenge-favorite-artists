//
//  ArtistListTableViewController.h
//  FavoriteArtists
//
//  Created by Lambda_School_Loaner_268 on 5/18/20.
//  Copyright © 2020 Lambda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSKArtistController.h"
#import "MSKArtist+NSJSONSerialization.h"
#import "MSKArtistDetailViewController.h"
#import "MSKArtist.h"


NS_ASSUME_NONNULL_BEGIN


@interface MSKArtistListTableViewController : UITableViewController

@property MSKArtistController *controller;



@end

NS_ASSUME_NONNULL_END
