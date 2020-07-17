//
//  ArtistDetailViewController.m
//  FavoriteArtists
//
//  Created by Nonye on 7/17/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

#import "ArtistDetailViewController.h"
#import "NNEArtist+NSJSONSerialization.h"
#import "NNEArtist.h"
#import "NNEArtistTableViewController.h"
#import "NNEArtistController.h"

@interface ArtistDetailViewController () <UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *detailTextView;

@end

@implementation ArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    [self updateViews];
}

- (IBAction)saveTapped:(id)sender {
    
    if (!_nneArtist) {
         self.title = @"No title";
         return;
     }
     
     [self.nneArtistController addArtistWithArtist:_nneArtist.artist year:_nneArtist.yearFormed bio:_nneArtist.biography];
     
     [self.navigationController popViewControllerAnimated:YES];
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    NSString *searchTerm = searchBar.text;
    NSLog(@"searchTerm%@", searchTerm);
    [self.nneArtistController fetchArtistByName:searchTerm completion:^(NNEArtist *favoriteArtist, NSError *error) {
        
        
        if (error) {
            NSLog(@"Error fetching artist");
            return;
        }
        
        // missing property year / artist not found
        if (!favoriteArtist) {
            NSLog(@"No valid results");
            dispatch_async(dispatch_get_main_queue(), ^{
                self.title = [NSString stringWithFormat:@"%@ not found", searchTerm];
            });
            return;
        }
        
       dispatch_async(dispatch_get_main_queue(), ^{
           self.nneArtist = favoriteArtist;
           [self updateViews];
        });
    }];

}

- (void)setNneArtist:(NNEArtist *)favoriteArtist {
    NSLog(@"favoriteArtist SET");
    _nneArtist = favoriteArtist;
    NSLog(@"%@", _nneArtist.artist);
    [self updateViews];
}

- (void)updateViews {
    NSLog(@"updateViews");
    
    if (!self.viewIfLoaded) { return; }
    
    // view
    if (self.nneArtist) {
        self.title = self.nneArtist.artist;
        self.artistNameLabel.text = self.nneArtist.artist;
        if ( self.nneArtist.yearFormed == 0 ) {
            self.yearFormedLabel.text = @"";
        }
        else {
            self.yearFormedLabel.text = [NSString stringWithFormat:@"%i", self.nneArtist.yearFormed];
        }
        self.detailTextView.text = self.nneArtist.biography;
    }
    
    // add
    else {
        self.title = @"Add New Artist";
        self.artistNameLabel.text = self.nneArtist.artist;
        self.yearFormedLabel.text = @"";
        self.detailTextView.text = self.nneArtist.biography;
    }
}

@end
