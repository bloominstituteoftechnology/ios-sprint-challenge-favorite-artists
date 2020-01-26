//
//  AddArtistViewController.h
//  FavoriteAritists
//
//  Created by brian vilchez on 1/24/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ArtistController;
@class Artist;
NS_ASSUME_NONNULL_BEGIN

@interface AddArtistViewController : UIViewController<UISearchBarDelegate>

@property ArtistController *artistController;
@property Artist * artist;
@property (strong, nonatomic) IBOutlet UILabel *bandNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (strong, nonatomic) IBOutlet UITextView *biographyLabel;
@property (strong, nonatomic) IBOutlet UISearchBar *searchbarLabel;
@end

NS_ASSUME_NONNULL_END
