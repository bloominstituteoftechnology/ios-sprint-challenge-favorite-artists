//
//  HSIArtistDetailViewController.m
//  Favorite Artists
//
//  Created by Kenny on 6/12/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

#import "HSIArtistDetailViewController.h"
#import "HSIArtistController.h"
#import "HSIArtist+NSJSONSerialization.h"

@interface HSIArtistDetailViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyLabel;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation HSIArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
    self.searchBar.delegate = self;
    [self.saveButton setEnabled:false];
}

- (IBAction)saveArtist:(id)sender {
    if (self.artist) {
        [self.controller addArtist:self.artist];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)updateViews
{
    if (self.artist) {
        [self setupArtist];
        [self.searchBar setHidden:true];
        self.navigationItem.rightBarButtonItem.enabled = false;
    } else {
        self.title = @"New Artist";
        self.nameLabel.text = @"";
        self.yearLabel.text = @"";
        self.biographyLabel.text = @"";
    }
}

- (void)setupArtist {
    self.title = self.artist.name;

    self.nameLabel.text = self.artist.name;

    if (self.artist.year == 0) {
        self.yearLabel.text = @"Unknown year formed";
    } else {
        self.yearLabel.text = [NSString stringWithFormat:@"Formed in %lu", self.artist.year];
    }

    self.biographyLabel.text = self.artist.biography;
    [self.saveButton setEnabled:true];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.controller findArtistWithName:searchBar.text completion:^(HSIArtist *artist) {

        dispatch_async(dispatch_get_main_queue(), ^{
            self.artist = artist;

            if (artist) {
                [self setupArtist];
            } else {
                self.nameLabel.text = [NSString stringWithFormat:@"We couldn't find %@.\nPlease try your search again.", searchBar.text];
                self.yearLabel.text = @"";
                self.biographyLabel.text = @"";
            }

        });
    }];
}

@end
