//
//  ArtistDetailViewController.m
//  FavoriteArtists
//
//  Created by Karen Rodriguez on 5/15/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

#import "ArtistDetailViewController.h"
#import "HLOArtistModelController.h"
#import "HLOArtist.h"

@interface ArtistDetailViewController () <UISearchBarDelegate>

// MARK:- Properties
@property (nonatomic) HLOArtist *artistResult;

// MARK:- Outlets
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearLabel;
@property (strong, nonatomic) IBOutlet UITextView *biographyText;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;

// MARK:- Actions
- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender;

@end

@implementation ArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupViews];
}

// MARK:- Methods

- (void)setupViews {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.artist) {
            [self.searchBar setHidden:true];
            [self.saveButton setEnabled:false];
            [self setTitle:[NSString stringWithFormat:@"%@", self.artist.artistName]];
            self.nameLabel.text = self.artist.artistName;
            self.yearLabel.text = self.artist.yearFormed == 1 ? @"No year data from database." : [NSString stringWithFormat:@"Formed in %d", self.artist.yearFormed];
            self.biographyText.text = self.artist.artistBiography;
        } else if (self.artistResult) {
            self.searchBar.delegate = self;
            self.nameLabel.text = self.artistResult.artistName;
            self.yearLabel.text = self.artistResult.yearFormed == 1 ? @"No year data from database." : [NSString stringWithFormat:@"Formed in %d", self.artistResult.yearFormed];
            self.biographyText.text = self.artistResult.artistBiography;
        } else {
            self.searchBar.delegate = self;
            self.searchBar.text = @"";
            self.nameLabel.text = @"";
            self.yearLabel.text = @"";
            self.biographyText.text = @"";
        }
    });
}

// MARK:- Protocol Conformation

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.artistController fetchArtistWithName:searchBar.text completionBlock:^(HLOArtist * _Nullable artist, NSError * _Nullable error) {
        if (error) {
            self.nameLabel.text = @"Error fetching data from server.";
            self.yearLabel.text = @"Artist name may be wrong.";
        }

        self.artistResult = artist;
        [self setupViews];
    }];
}

// MARK:- Actions
- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    if (self.artistResult) {
        [self.artistController.favoriteArtists addObject:self.artistResult];
        [self.navigationController popViewControllerAnimated:true];
    }
}
@end
