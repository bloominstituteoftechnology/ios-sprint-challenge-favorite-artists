//
//  AddArtistViewController.m
//  FavoriteArtists
//
//  Created by Craig Belinfante on 11/22/20.
//

#import "AddArtistViewController.h"
#import "AddArtistViewController.h"
#import "FavoriteArtist.h"
#import "ArtistFetcher.h"

@interface AddArtistViewController ()

@end

@implementation AddArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.searchBar.delegate = self;
    [self updateViews];
}

//Search Bar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {

    NSString *searchTerm = [searchBar text];
    NSLog(@"Searching for: %@", searchTerm);
    
    [self.artistsFetcher fetchArtistWithSearchTerm:searchTerm
                                        completion:^(FavoriteArtist * _Nonnull artist, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.artist = artist;
            [self updateViews];
        });
        
    }];
}

//Save Artists
- (IBAction)saveButtonPressed:(id)sender {
    [self save];
}

- (void)save {
    if (self.artist) {
        [self.artistsFetcher addArtist:self.artist];
        [self.navigationController popViewControllerAnimated:true];
    }
}
- (void)updateViews {
    if (self.artist) {
        self.artistLabel.text = self.artist.artist;
        self.artistYear.text = [[NSString alloc] initWithFormat:@"Formed in %i", self.artist.year];
        self.artistBio.text = self.artist.biography;
    }
}

@end
