//
//  ArtistDetailViewController.m
//  FavoriteArtists
//
//  Created by Jessie Ann Griffin on 5/29/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

#import "ArtistDetailViewController.h"
#import "ArtistFetcher.h"
#import "ArtistController.h"

@interface ArtistDetailViewController () <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UILabel *biographyLabel;

- (void)updateViews;

@end

@implementation ArtistDetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [self updateViews];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *name = searchBar.text;
    ArtistFetcher *fetcher = [[ArtistFetcher alloc] init];
    [fetcher fetchArtistWithName:name
               completionHandler:^(Artist * _Nullable artist, NSError * _Nullable error) {
        self.artist = artist;
        [self updateViews];
    }];
}

- (void)updateViews
{
    if (self.artist != nil) {
        _artistNameLabel.text = self.artist.artistName;
        if (self.artist.yearFormed != 0) {
            _yearFormedLabel.text = [NSString stringWithFormat:@"Formed in %d", self.artist.yearFormed];
        } else {
            _yearFormedLabel.text = @"Year formed unavailable.";
        }
        _biographyLabel.text = self.artist.artistBiography;
    }
}

- (IBAction)saveTapped:(UIBarButtonItem *)sender {

    // Saved to persistance
//    [self.artistController saveToPersistentStore:self.artist];

    [self.artistController saveArtistToFavorites:self.artist];

    [self.navigationController popToRootViewControllerAnimated:YES];

}

@end
