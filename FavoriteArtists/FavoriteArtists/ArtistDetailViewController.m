//
//  ArtistDetailViewController.m
//  FavoriteArtists
//
//  Created by Bobby Keffury on 2/7/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

#import "ArtistDetailViewController.h"
#import "ArtistController.h"
#import "Artist.h"

@interface ArtistDetailViewController () <UISearchBarDelegate>

//MARK: - Outlets

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *foundedLabel;
@property (weak, nonatomic) IBOutlet UITextView *detailsTextView;

@end

@implementation ArtistDetailViewController

//MARK: - Views

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _artistController = [[ArtistController alloc] init];
    
    [self updateViews];
}

//MARK: - Methods

- (void)updateViews
{
    self.title = self.artist.name?: @"Search Artists";
    
    if (!self.isViewLoaded || !self.artist) { return; }
    
    self.foundedLabel.text = self.artist.founded;
    self.detailsTextView.text = self.artist.details;
}

- (void) setArtist:(Artist *)artist
{
    if (_artist != artist) {
        _artist = artist;
        [self updateViews];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    
    NSString *searchTerm = searchBar.text;
    
    [_artistController fetchArtistWithSearchTerm:searchTerm completionHandler:^(Artist * artist, NSError * error) {
        
        if (error) {
            NSLog(@"Error fetching artist: %@", error);
        }
        
        if (artist) {
            self.artist = artist;
        }
    }];
    
    [self updateViews];
}

//MARK: - Actions

- (IBAction)saveButtonTapped:(id)sender
{
    [_artistController addArtist:self.artist];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
