//
//  IGFAddArtistViewController.m
//  IGFArtist
//
//  Created by Ian French on 9/27/20.
//

#import "IGFAddArtistViewController.h"
#import "IGFArtist.h"
#import "IGFArtistController.h"
#import "IGFArtist+NSJONSerialization.h"

@interface IGFAddArtistViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;



@end

@implementation IGFAddArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
    [self.searchBar setDelegate:self];
}

- (void)updateViews {
    if (self.artist) {
        self.nameLabel.text = self.artist.name;
        self.yearLabel.text = [NSString stringWithFormat:@"Circa: %@", [self.artist formedYearString]];
        self.biographyTextView.text = self.artist.biography;
    } else {
        self.nameLabel.text = @"";
        self.yearLabel.text = @"";
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

    [self.artistController searchForArtistByName:searchBar.text completion:^(IGFArtist *artist, NSError *error) {
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
