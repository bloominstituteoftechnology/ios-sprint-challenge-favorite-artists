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
    self.searchBar.delegate = self;
}

- (void)updateViews {
    if (!self.artist) {
        self.title = @"";
        self.artistNameLabel.text = self.artist.name;
        self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in %i", self.artist.yearFormed];
        self.artistBioTextView.text = self.artist.bio;

        [self.searchBar setHidden:YES];
        [self.saveButton setEnabled:NO];
        self.saveButton.tintColor = [UIColor clearColor];
    } else {
        [self.artistNameLabel setHidden:YES];
        [self.yearFormedLabel setHidden:YES];
        [self.artistBioTextView setHidden:YES];
    }
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
}

@end
