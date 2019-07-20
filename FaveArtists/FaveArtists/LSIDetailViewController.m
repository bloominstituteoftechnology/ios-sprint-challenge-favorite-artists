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
    
    _artistSearchBar.delegate = self;
    
    [self updateViews];
}

- (void)updateViews {
    
    if (!self.isViewLoaded || !self.artist) { return; }
    
    self.artistLabel.text = self.artist.strArtist;
    self.yearFoundedLabel.text = [NSString stringWithFormat:@"%@", [NSString stringWithFormat:@"%ld", self.artist.intFormedYear]];
    self.bioTextView.text = self.artist.strBiographyEN;
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    // call fetchArtistInfo function of ArtistController
    NSError *error = nil;
    NSString *searchText = self.artistSearchBar.text;
    NSArray *artistsArrayTemp;
    // we may need a completionHandler to the call here so we can get back artist
    [LSIArtistController fetchArtistWith:searchText completionBlock:^(NSArray * _Nonnull artistsArrayTemp, NSError * _Nonnull error)];
    
    // example of closured function call [self fetchQuakesFromDateInterval:dateInterval completitionBlock:completionBlock
    
    
    // UPDATE VIEWS NOT GOING TO WORK UNLESS WE EXTRACT THE ARTIST GRABBED FROM THE NETWORK CALL ABOVE
    
    
    [self updateViews];
    
}

//- (IBAction)saveButtonTapped:(id)sender {
//    
//    // initialize an Artist Model with data from 3 Outlets
//    _artist = [[LSIArtist alloc] init];   // compiler demanded _artist instedo artist
//    [self createArtistFromSearchResults:self.artist]  // is artist ok going func to func here?
//    
//    // add Artist to bands array to persist
//    [self.artistController addArtist:artist];
//    
//    
//    [self.navigationController popViewControllerAnimated:YES];
//}

- (void)createArtistFromSearchResults:(LSIArtist *)artist {
    artist.strArtist = self.artistLabel.text;
    artist.intFormedYear = self.yearFoundedLabel.text;
    artist.strBiographyEN = self.bioTextView.text;
    
    // set Labels and textField back to default or blank
}




@end
