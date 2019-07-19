//
//  LSIDetailViewController.m
//  FaveArtists
//
//  Created by John Pitts on 7/19/19.
//  Copyright © 2019 johnpitts. All rights reserved.
//

#import "LSIDetailViewController.h"
#import "LSIArtist.h"
#import "LSIArtistController.h"


@interface LSIDetailViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *artistSearchBar;

@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFoundedLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;


@end

@implementation LSIDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self updateViews]
}

- (void)updateViews {
    
    if (!self.isViewLoaded || !self.artist) { return; }
    
    self.artistLabel.text = self.artist.strArtist;
    self.notesTextView.text = self.artist.intFormedYear;
    self.bioTextView.text = self.artist.strBiographyEN;
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    // call fetchArtistInfo function of ArtistController
    
    [self.artistController fetchArtist]    // fetchArtist needs a return value of artist
    
    //display search results with [self updateViews]
    
}

- (IBAction)saveButtonTapped:(id)sender {
    
    // initialize an Artist Model with data from 3 Outlets
    artist = [[LSIArtist alloc] init];
    [self createArtistFromSearchResults:self.artist]
     [self.artistController artist];
    
    // add Artist to bands array to persist
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)createArtistFromSearchResults:(LSIArtist *)artist {
    artist.strArtist = self.artistLabel.text;
    artist.intFormedYear = self.yearFoundedLabel.text;
    artist.strBiographyEN = self.bioTextView.text;
    
    // set Labels and textField back to default or blank
}




@end
