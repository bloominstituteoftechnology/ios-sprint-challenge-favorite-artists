//
//  SBADetailSearchViewController.m
//  Favorite Artists
//
//  Created by Sal B Amer on 5/29/20.
//  Copyright © 2020 Sal B AmerDEv. All rights reserved.
//

#import "SBADetailSearchViewController.h"
#import "../Model Controller/SBAArtistModelController.h"
#import "../Model/SBAArtist.h"

// add search bar delegate
@interface SBADetailSearchViewController () <UISearchBarDelegate>

@property (nonatomic) SBAArtist *artistResult;

//MARK Outlets
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistName;
@property (weak, nonatomic) IBOutlet UILabel *artistFormationLbl;
@property (weak, nonatomic) IBOutlet UITextView *artistBioTextView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveBtn;

//Mark Action
- (IBAction)saveButtnPressed:(UIBarButtonItem *)sender;

@end


@implementation SBADetailSearchViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self updateViews];
}

- (void)updateViews {
  dispatch_async(dispatch_get_main_queue(), ^{
    if (self.artist) {
      [self.saveBtn setEnabled:false];
      [self.searchBar setHidden:true];
      [self setTitle:[NSString stringWithFormat:@"%@", self.artist.name]];
      self.artistName.text = self.artist.name;
      self.artistFormationLbl.text = self.artist.yearFormed == 1 ? @"No formation year found in DB." : [NSString stringWithFormat:@"Formed in %d", self.artist.yearFormed];
      self.artistBioTextView.text = self.artist.biography;
    } else if (self.artistResult) {
      self.searchBar.delegate = self;
      self.artistName.text = self.artistResult.name;
      self.artistFormationLbl.text = self.artistResult.yearFormed == 1 ? @"No formation year found in DB." : [NSString stringWithFormat:@"Formed in %d", self.artistResult.yearFormed];
      self.artistBioTextView.text = self.artistResult.biography;
    } else { // blank out results to start
      self.searchBar.delegate = self;
      self.searchBar.text = @"";
      self.artistName.text = @"";
      self.artistFormationLbl.text = @"";
      self.artistBioTextView.text = @"";
    }
  });
}

//Setup Search
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
  [self.artistController fetchArtistWithName:searchBar.text completionBlock:^(SBAArtist * _Nullable artist, NSError * _Nullable error) {
    if (error) {
      dispatch_async(dispatch_get_main_queue(), ^{
        [self.artistName setHidden:false];
        [self.artistFormationLbl setHidden:false];
        self.artistName.text = @"Error fetching artist name from DB.";
        self.artistFormationLbl.text = @"Error fetching artist formation year.";
      });
      return;
    }
    self.artistResult = artist;
    [self updateViews];
  }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveButtnPressed:(id)sender {
  if (self.artistResult) {
     [self.artistController.favoriteArtists addObject:self.artistResult];
     [self.navigationController popToRootViewControllerAnimated:true];
  }  
}
@end
