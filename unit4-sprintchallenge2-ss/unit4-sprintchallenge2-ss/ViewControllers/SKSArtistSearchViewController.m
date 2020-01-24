//
//  SKSArtistSearchViewController.m
//  unit4-sprintchallenge2-ss
//
//  Created by Lambda_School_Loaner_204 on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "SKSArtistSearchViewController.h"
#import "SKSArtist.h"
#import "SKSArtist+NSJSONSerialization.h"
#import "SKSArtistController.h"

@interface SKSArtistSearchViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *formedYearLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;

- (void)updateViews;
- (void)saveArtistToDictionary;

@end

@implementation SKSArtistSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
    [self.searchBar setDelegate:self];
}

- (void)updateViews {
    if (self.artist) {
        self.nameLabel.text = self.artist.name;
        self.formedYearLabel.text = [NSString stringWithFormat:@"Formed in: %@", [self.artist formedYearString]];
        self.biographyTextView.text = self.artist.biography;
    } else {
        self.nameLabel.text = @"";
        self.formedYearLabel.text = @"";
        self.biographyTextView.text = @"";
    }
}

- (IBAction)saveButtonTapped:(id)sender {
    [self saveArtistToDictionary];
}

- (void)saveArtistToDictionary {

    [self.artistController writeDictionaryToFile:[self.artist toDictionary]];

    [self.navigationController popViewControllerAnimated:TRUE];
}

#pragma mark UISearchBarDelegate Methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {

    [self.artistController searchForArtistsByName:searchBar.text completion:^(SKSArtist *artist, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                NSLog(@"Error: %@", error);
                return;
            }
            self.artist = artist;
            [self updateViews];
        });

    }];
}

@end
