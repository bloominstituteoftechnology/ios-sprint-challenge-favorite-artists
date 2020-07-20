//
//  HMRArtistsViewController.m
//  FavoriteArtist
//
//  Created by Harmony Radley on 7/17/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

#import "HMRArtistsViewController.h"
#import "HMRArtistController.h"
#import "HMRArtist.h"

@interface HMRArtistsViewController ()

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation HMRArtistsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    [self updateViews];
}

- (IBAction)saveButtonTapped:(id)sender {

    if (!_favoriteArtist) {
        self.title = @"No Artist Available";
        return;
    }

    [self.artistController addArtistWithArtist:_favoriteArtist.artist year:_favoriteArtist.yearFormed bio:_favoriteArtist.biography];

    [self.navigationController popViewControllerAnimated:YES];
}


- (void)searchBarButtonClicked:(UISearchBar *)searchBar {

    NSString *searchTerm = searchBar.text;
    NSLog(@"searchTerm%@", searchTerm);
    [self.artistController favoriteArtistForName:searchTerm completion:^(HMRArtist *favoriteArtist, NSError *error) {


        if (error) {
            NSLog(@"Error fetching artist");
            return;
        }

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

- (void)setHMRArtist:(HMRArtist *)favoriteArtist {
    _favoriteArtist = favoriteArtist;
    NSLog(@"%@", _favoriteArtist.artist);
    [self updateViews];
}

- (void)updateViews {
    NSLog(@"updateViews");

    if (!self.viewIfLoaded) { return; }

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

    else {
        self.title = @"Add New Artist";
        self.artistNameLabel.text = self.favoriteArtist.artist;
        self.yearFormedLabel.text = @"";
        self.textView.text = self.favoriteArtist.biography;
    }
}

@end
