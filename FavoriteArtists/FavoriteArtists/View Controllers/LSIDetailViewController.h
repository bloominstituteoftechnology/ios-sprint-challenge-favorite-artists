//
//  LSIDetailViewController.h
//  FavoriteArtists
//
//  Created by Alex on 7/19/19.
//  Copyright © 2019 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LSIArtist;
@class LSIArtistController;

@interface LSIDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *formedLbl;
@property (weak, nonatomic) IBOutlet UITextView *detailTextView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property LSIArtistController *artistController;
@property (nonatomic) LSIArtist *artist;


@end

NS_ASSUME_NONNULL_END
