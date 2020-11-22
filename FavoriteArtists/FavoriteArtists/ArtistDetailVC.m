//
//  ArtistDetailVC.m
//  FavoriteArtists
//
//  Created by Cora Jacobson on 11/21/20.
//

#import "ArtistDetailVC.h"
#import "Artist.h"
#import "ArtistController.h"

@interface ArtistDetailVC () <UISearchBarDelegate>

@property (nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic) IBOutlet UILabel *artistNameLabel;
@property (nonatomic) IBOutlet UILabel *foundedLabel;
@property (nonatomic) IBOutlet UITextView *descriptionTextView;

@end

@implementation ArtistDetailVC

@synthesize artistController;

- (void)viewDidLoad {
    [super viewDidLoad];
    _searchBar.delegate = self;
    [self detailMode];
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
    [self.artistController.artists addObject:self.artist];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)updateViews {
    if (self.artist) {
        self.title = self.artist.artistName;
        self.artistNameLabel.textColor = UIColor.blackColor;
        self.foundedLabel.textColor = UIColor.blackColor;
        self.artistNameLabel.text = self.artist.artistName;
        if (self.artist.formedYear > 0) {
            self.foundedLabel.text = [NSString stringWithFormat:@"%d", self.artist.formedYear];
        } else {
            self.foundedLabel.text = @"year founded is unknown or not applicable";
            self.foundedLabel.textColor = UIColor.grayColor;
        }
        self.descriptionTextView.text = self.artist.biography;
    } else {
        self.descriptionTextView.text = @"";
        self.artistNameLabel.textColor = UIColor.grayColor;
        self.foundedLabel.textColor = UIColor.grayColor;
    }
}

- (void)detailMode {
    if (self.artist) {
        self.searchBar.hidden = YES;
        self.saveButton.enabled = NO;
        self.saveButton.tintColor = UIColor.clearColor;
    } else {
        self.saveButton.enabled = YES;
        self.saveButton.tintColor = UIColor.blueColor;
        self.searchBar.hidden = NO;
    }
}

@end
