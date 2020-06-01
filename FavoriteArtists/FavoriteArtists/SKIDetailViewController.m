//
//  SKIDetailViewController.m
//  FavoriteArtists
//
//  Created by Joshua Rutkowski on 5/31/20.
//

#import "SKIDetailViewController.h"
#import "SKIArtistController.h"
#import "SKIArtist.h"

@interface SKIDetailViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *aboutAristTextView;

@end

@implementation SKIDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBar setDelegate:self];
    [self updateViews];
}

- (void)updateViews {
    self.nameLabel.text = self.artist.name;
    self.aboutAristTextView.text = self.artist.about;
    self.yearLabel.text = [self yearString];
}

- (NSString *)yearString {
    if (self.artist.year != 0) {
        return [NSString stringWithFormat:@"%i", self.artist.year];
    } else {
        return @"Not available";
    }
}

- (IBAction)saveButtonTapped:(id)sender {
    if (self.artist) {
        NSLog(@"saveTapped");
        [self.artistController saveArtist:self.artist];
        [self.navigationController popViewControllerAnimated:true];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *searchTerm = searchBar.text;
    
    [self.artistController searchForArtistWithName:searchTerm completion:^(SKIArtist *artist, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Artist: %@, Error: %@", artist.name, error);
            self.artist = artist;
            [self updateViews];
            NSLog(@"called!");
        });
    }];
}

@end
