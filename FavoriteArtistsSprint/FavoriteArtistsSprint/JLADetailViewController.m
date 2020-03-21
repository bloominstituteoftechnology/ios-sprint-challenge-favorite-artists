//
//  JLADetailViewController.m
//  FavoriteArtistsSprint
//
//  Created by Jorge Alvarez on 3/20/20.
//  Copyright © 2020 Jorge Alvarez. All rights reserved.
//

#import "JLADetailViewController.h"
#import "JLAFavoriteArtistController.h"
#import "JLAFavoriteArtist.h"

@interface JLADetailViewController () <UISearchBarDelegate>
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (strong, nonatomic) IBOutlet UITextView *textView;

@end

@implementation JLADetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    [self updateViews];
}

- (IBAction)saveTapped:(UIBarButtonItem *)sender {
    
    if (!_favoriteArtist) {
        self.title = @"Why would you do that?";
        return;
    }
    
    [self.favoriteArtistController addArtistWithArtist:_favoriteArtist.strArtist year:_favoriteArtist.intFormedYear bio:_favoriteArtist.strBiographyEN];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    NSString *searchTerm = searchBar.text;
    NSLog(@"searchTerm%@", searchTerm);
    [self.favoriteArtistController fetchFavoriteArtistByName:searchTerm completion:^(JLAFavoriteArtist *favoriteArtist, NSError *error) {
        
        // hey
        if (error) {
            NSLog(@"Error fetching artist");
            return;
        }
        
        // missing property year / artist not found
        if (!favoriteArtist) {
            NSLog(@"No valid results");
            dispatch_async(dispatch_get_main_queue(), ^{
                self.title = [NSString stringWithFormat:@"%@ not found :(", searchTerm];
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
- (void)setFavoriteArtist:(JLAFavoriteArtist *)favoriteArtist {
    NSLog(@"favoriteArtist SET");
    _favoriteArtist = favoriteArtist;
    NSLog(@"%@", _favoriteArtist.strArtist);
    [self updateViews];
}

- (void)updateViews {
    NSLog(@"updateViews");
    
    if (!self.viewIfLoaded) { return; }
    
    // view
    if (self.favoriteArtist) {
        self.title = self.favoriteArtist.strArtist;
        self.artistNameLabel.text = self.favoriteArtist.strArtist;
        if ( self.favoriteArtist.intFormedYear == 0 ) {
            self.yearFormedLabel.text = @"";
        }
        else {
            self.yearFormedLabel.text = [NSString stringWithFormat:@"%i", self.favoriteArtist.intFormedYear];
        }
        self.textView.text = self.favoriteArtist.strBiographyEN;
    }
    
    // add
    else {
        self.title = @"Add New Artist";
        self.artistNameLabel.text = self.favoriteArtist.strArtist;
        self.yearFormedLabel.text = @"";
        self.textView.text = self.favoriteArtist.strBiographyEN;
    }
}

@end
