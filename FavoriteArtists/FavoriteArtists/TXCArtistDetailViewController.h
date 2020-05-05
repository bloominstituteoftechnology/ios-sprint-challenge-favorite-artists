//
//  TXCArtistDetailViewController.h
//  FavoriteArtists
//
//  Created by Thomas Cacciatore on 7/19/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class TXCArtistController;
@class TXCArtist;

@interface TXCArtistDetailViewController : UIViewController <UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;


@property TXCArtistController *artistController;
@property (nonatomic) TXCArtist *artist;


@end

NS_ASSUME_NONNULL_END
