//
//  ArtistDetailViewController.m
//  Favorite Artists
//
//  Created by Michael Stoffer on 11/9/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

#import "ArtistDetailViewController.h"
#import "ArtistFetcher.h"
#import "Artist.h"

#import "Artist+NSJSONSerialization.h"

@interface ArtistDetailViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITextField *artistName;
@property (weak, nonatomic) IBOutlet UITextField *formedLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;

@end

@implementation ArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBar setDelegate:self];
    [self updateViews];
}

- (IBAction)save:(UIBarButtonItem *)sender {
    Artist *artist = [[Artist alloc] initWithArtistName:self.artistName.text biography:self.bioTextView.text formed:self.artist.yearFormed];
    [self.artistFetcher addArtist:artist];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)updateViews
{
    self.title = self.artist.name ?: @"Add New Artist";
    if (!self.isViewLoaded || !self.artist) { return; }
    
    self.artistName.text = self.artist.name;
    self.formedLabel.text = [NSString stringWithFormat:@"Formed in %i", self.artist.yearFormed];
    self.bioTextView.text = self.artist.bio;
}

- (void)setArtist:(Artist *)artist
{
    if (_artist != artist) {
        _artist = artist;
        [self updateViews];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *searchTerm = searchBar.text;
    [_artistFetcher fetchArtist:searchTerm completionHandler:^(Artist *artist, NSError *error) {
        self.artist = artist;
        [self updateViews];
    }];
}

@end
