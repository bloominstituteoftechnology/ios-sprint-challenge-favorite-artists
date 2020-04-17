//
//  KMLArtistSearchViewController.m
//  FavoriteArtists
//
//  Created by Keri Levesque on 4/17/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

#import "KMLArtistSearchViewController.h"
#import "KMLArtist.h"
#import "KMLArtistController.h"
#import "NSJSONSerialization+KMLArtist_.h"

@interface KMLArtistSearchViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *formedYearLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyView;



- (void)updateViews;
- (void)saveArtistToDictionary;

@end

@implementation KMLArtistSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
    [self.searchBar setDelegate:self];
}

- (void)updateViews {
    if (self.artist) {
        self.artistNameLabel.text = self.artist.name;
        self.formedYearLabel.text = [NSString stringWithFormat:@"Formed in: %@", [self.artist formedYearString]];
        self.biographyView.text = self.artist.biography;
    } else {
        self.artistNameLabel.text = @"";
        self.formedYearLabel.text = @"";
        self.biographyView.text = @"";
    }
}

- (IBAction)saveButtonTapped:(id)sender {
    [self saveArtistToDictionary];
}

- (void)saveArtistToDictionary {

    [self.artistController writeDictionaryToFile:[self.artist toDictionary]];

    [self.navigationController popViewControllerAnimated:TRUE];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {

    [self.artistController searchForArtistsByName:searchBar.text completion:^(KMLArtist *artist, NSError *error) {
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
