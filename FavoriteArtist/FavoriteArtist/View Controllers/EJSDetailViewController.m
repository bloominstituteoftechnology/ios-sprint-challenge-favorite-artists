//
//  EJSDetailViewController.m
//  FavoriteArtist
//
//  Created by Enzo Jimenez-Soto on 7/17/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

#import "EJSDetailViewController.h"
#import "EJSFavoriteArtistController.h"
#import "EJSFavoriteArtist.h"


@interface EJSDetailViewController () <UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation EJSDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    [self updateViews];
}

- (IBAction)saveTapped:(id)sender {
    
    if (!_favoriteArtist) {
         self.title = @"Why would you do that?";
         return;
     }
     
     [self.favoriteArtistController addArtistWithArtist:_favoriteArtist.artist year:_favoriteArtist.yearFormed bio:_favoriteArtist.biography];
     
     [self.navigationController popViewControllerAnimated:YES];
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    NSString *searchTerm = searchBar.text;
    NSLog(@"searchTerm%@", searchTerm);
    [self.favoriteArtistController fetchFavoriteArtistByName:searchTerm completion:^(EJSFavoriteArtist *favoriteArtist, NSError *error) {
        
        
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
           self.favoriteArtist = favoriteArtist;
           [self updateViews];
        });
    }];

}

/// didSet, called when self.favoriteArtist is set
- (void)setFavoriteArtist:(EJSFavoriteArtist *)favoriteArtist {
    NSLog(@"favoriteArtist SET");
    _favoriteArtist = favoriteArtist;
    NSLog(@"%@", _favoriteArtist.artist);
    [self updateViews];
}

- (void)updateViews {
    NSLog(@"updateViews");
    
    if (!self.viewIfLoaded) { return; }
    
    // view
    if (self.favoriteArtist) {
        self.title = self.favoriteArtist.artist;
        self.artistNameLabel.text = self.favoriteArtist.artist;
        if ( self.favoriteArtist.yearFormed == 0 ) {
            self.yearFormedLabel.text = @"";
        }
        else {
            self.yearFormedLabel.text = [NSString stringWithFormat:@"%i", self.favoriteArtist.yearFormed];
        }
        self.textView.text = self.favoriteArtist.biography;
    }
    
    // add
    else {
        self.title = @"Add New Artist";
        self.artistNameLabel.text = self.favoriteArtist.artist;
        self.yearFormedLabel.text = @"";
        self.textView.text = self.favoriteArtist.biography;
    }
}

@end
