//
//  JCSArtistsTableViewController.h
//  FavoriteArtists
//
//  Created by Lambda_School_Loaner_95 on 4/4/19.
//  Copyright © 2019 JS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JCSArtistController;

NS_ASSUME_NONNULL_BEGIN

@interface JCSArtistsTableViewController : UITableViewController

@property JCSArtistController *artistController;
//-(void)loadFromPersistentStore;
@end

NS_ASSUME_NONNULL_END
