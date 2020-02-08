//
//  JDKAddArtistViewController.h
//  FavoriteArtist
//
//  Created by John Kouris on 2/8/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDKArtistController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JDKAddArtistViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property JDKArtistController *artistController;
@property JDKArtist *searchedArtist;

@end

NS_ASSUME_NONNULL_END
