//
//  OTKSearchArtistViewController.m
//  FavoriteArtists
//
//  Created by Tobi Kuyoro on 15/05/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

#import "OTKSearchArtistViewController.h"
#import "OTKArtist.h"
#import "OTKArtistController.h"
#import "OTKArtist+NSJSONSerialization.h"

@interface OTKSearchArtistViewController ()

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (strong, nonatomic) IBOutlet UITextView *artistBioTextView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation OTKSearchArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
    self.searchBar.delegate = self;
}

- (void)updateViews {
    if (!self.artist) {
        self.title = @"Add New Artist";
        self.searchBar.placeholder = @"Artist Name:";

        [self.searchBar setHidden:NO];
        [self.artistNameLabel setHidden:YES];
        [self.yearFormedLabel setHidden:YES];
        [self.artistBioTextView setHidden:YES];
        [self.saveButton setEnabled:NO];
        self.saveButton.tintColor = [UIColor clearColor];
    } else {
        self.artistNameLabel.text = self.artist.name;
        self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in %i", self.artist.yearFormed];
        self.artistBioTextView.text = self.artist.bio;

        self.title = @"";
        [self.searchBar setHidden:YES];
        [self.artistNameLabel setHidden:NO];
        [self.yearFormedLabel setHidden:NO];
        [self.artistBioTextView setHidden:NO];
        [self.saveButton setEnabled:YES];
        self.saveButton.tintColor = [UIColor blackColor];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.artistController findArtist:searchBar.text completion:^(OTKArtist * _Nullable artist, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error finding artist");
            return;
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            if (artist) {
                self.artist = artist;
                [self updateViews];
            }
        });
    }];

    [self.searchBar endEditing:YES];
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    [self.artistController saveArtist:self.artist];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
