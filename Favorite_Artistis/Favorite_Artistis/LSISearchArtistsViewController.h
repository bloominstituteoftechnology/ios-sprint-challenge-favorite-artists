//
//  LSISearchArtistsViewController.h
//  Favorite_Artistis
//
//  Created by Joe on 5/30/20.
//  Copyright © 2020 AlphaGradeINC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSIArtist.h"
#import "LSIArtistController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSISearchArtistsViewController : UIViewController <UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *dateFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *artistBioLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *artistSaveButton;

@property (nonatomic, readwrite) LSIArtistController *lsiArtistController;

@property (nonatomic) LSIArtist *artist;

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;

- (void)updateViews;

- (void)clearViews;

@end

//@protocol LSISearchArtistsViewControllerDelegate <NSObject>
//
//- (void)lsiSearchArtistsViewController:(LSISearchArtistsViewController *)lsiSearchArtistsViewController didGetUpdatedList:(id);
//
//@end

NS_ASSUME_NONNULL_END
