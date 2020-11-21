//
//  ArtistDetailVC.m
//  FavoriteArtists
//
//  Created by Cora Jacobson on 11/21/20.
//

#import "ArtistDetailVC.h"
#import "Artist.h"
#import "Artists.h"
#import "ArtistController.h"

@interface ArtistDetailVC ()

@property (nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic) IBOutlet UILabel *artistNameLabel;
@property (nonatomic) IBOutlet UILabel *foundedLabel;
@property (nonatomic) IBOutlet UITextView *descriptionTextView;

@property (nonatomic) Artist *artist;

@end

@implementation ArtistDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _searchBar.delegate = self;
    [self updateViews];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *searchTerm = searchBar.text;
    if (searchTerm) {
        [ArtistController searchArtistsWithSearchTerm:searchTerm completionHandler:^(Artist *artist, NSError *error) {
            NSLog(@"Error fetching artist: %@", error);
            self.artist = artist;
            [self updateViews];
        }];
    }
}

- (IBAction)saveButton:(id)sender
{
    
}

- (void)updateViews {
    if (self.artist) {
        self.title = self.artist.artistName;
        self.artistNameLabel.text = self.artist.artistName;
        self.foundedLabel.text = [NSString stringWithFormat:@"%d", self.artist.formedYear];
        self.descriptionTextView.text = self.artist.biography;
    }
}

@end
