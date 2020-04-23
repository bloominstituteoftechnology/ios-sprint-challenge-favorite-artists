//
//  SearchArtistsViewController.m
//  FavoriteArtistsSprintChallenge
//
//  Created by Dillon P on 4/19/20.
//  Copyright © 2020 Dillon's Lambda Team. All rights reserved.
//

#import "SearchArtistsViewController.h"
#import "Artist.h"
#import "ArtistFetcher.h"
#import "Artist+NSJSONSerialization.h"
#import "FavoriteArtistsViewController.h"

@interface SearchArtistsViewController () <UISearchBarDelegate, UITextFieldDelegate>

// Properties
@property (nonatomic) NSString *artistName;
@property (nonatomic) int yearFounded;
@property (nonatomic) NSString *artistBio;

@property (nonatomic) Artist *artist;

@property (nonatomic) BOOL isTyping;

// IBOutlets
@property (nonatomic) IBOutlet UILabel *artistNameLabel;
@property (nonatomic) IBOutlet UILabel *yearFoundedLabel;
@property (nonatomic) IBOutlet UITextView *artistBioTextView;
@property (nonatomic) IBOutlet UISearchBar *artistSearchBar;
@property (nonatomic) IBOutlet UIBarButtonItem *saveButton;

// Private Methods
- (void)saveNewFavoriteArtist;

@end


@implementation SearchArtistsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (!self.artistDetail) {
        self.artistNameLabel.text = @"";
        self.yearFoundedLabel.text = @"";
        self.artistBioTextView.text = @"";
    } else {
        self.artistNameLabel.text = self.artistDetail.artistName;
        if (self.artistDetail.yearFounded == 0) {
            [self.yearFoundedLabel setHidden:YES];
        } else {
            self.yearFoundedLabel.text = [NSString stringWithFormat:@"%d", self.artistDetail.yearFounded];
        }
        self.artistBioTextView.text = self.artistDetail.artistBio;
        [self.artistSearchBar setHidden:YES];
        self.saveButton.tintColor = UIColor.clearColor;
    }
    
    self.isTyping = NO;
    
}

// MARK: - Private Methods

- (void)saveNewFavoriteArtist
{
    if (self.artist) {
        [self.artistFetcher saveLocalDictionaryWithNewArtist:self.artist];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)searchForArtistWithName:(NSString *)searchText
{
    if (!self.isTyping) {
        [self.artistFetcher fetchArtistFromServer:searchText WithCompletionHandler:^(Artist * _Nullable artist, NSError * _Nullable error) {
            if (artist) {
                self.artist = artist;
                self.artistNameLabel.text = artist.artistName;
                self.artistBioTextView.text = artist.artistBio;
                if (artist.yearFounded != 0) {
                    NSString *yearFoundedText = [NSString stringWithFormat:@"%d", artist.yearFounded];
                    self.yearFoundedLabel.text = yearFoundedText;
                } else {
                    self.yearFoundedLabel.text = @"";
                }
            }
        }];
    }
}


// MARK: - IBActions

- (IBAction)saveButtonTapped:(id)sender
{
    [self saveNewFavoriteArtist];
}

// MARK: - UISearchBar

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self searchForArtistWithName:searchText];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    self.isTyping = YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    self.isTyping = NO;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    self.isTyping = NO;
    [searchBar resignFirstResponder];
    [self searchForArtistWithName:searchBar.searchTextField.text];
}

@end
