//
//  LSIArtistDetailViewController.m
//  FavoriteArtists
//
//  Created by Elizabeth Thomas on 9/27/20.
//

#import "LSIArtistDetailViewController.h"
#import "LSIArtist.h"
#import "LSIArtistFetcher.h"
#import "LSIArtistController.h"

@interface LSIArtistDetailViewController ()

// MARK: - Properties
@property LSIArtistFetcher *artistFetcher;

// MARK: - IBOutlets
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (strong, nonatomic) IBOutlet UITextView *artistBiographyLabel;


@end


@implementation LSIArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.artistFetcher = [[LSIArtistFetcher alloc] init];
    self.searchBar.delegate = self;

    if (self.isShowingArtistDetail) {
        [self.searchBar removeFromSuperview];
        self.navigationItem.rightBarButtonItem = nil;
    }

    [self updateViews];
}

- (IBAction)saveButtonTapped:(id)sender {
    if (self.artist == nil) return;
    [self.artistController addArtist:self.artist];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)updateViews{
    if (self.artist != nil) {
        self.artistNameLabel.text = _artist.name;
        self.artistBiographyLabel.text = _artist.biography;

        if (self.artist.yearFormed != 0) {
            NSString *yearFormedString = [NSString stringWithFormat:@"Formed in %d", self.artist.yearFormed];
            self.yearFormedLabel.text = yearFormedString;
        } else {
            self.yearFormedLabel.text = @"Year Formed: Unknown";
        }
    } else {
        self.artistNameLabel.text = nil;
        self.yearFormedLabel.text = nil;
        self.artistBiographyLabel.text = nil;
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *searchTerm = searchBar.text;
    if ([searchTerm isEqualToString:@""]) return;

    NSLog(@"Searching for %@", searchTerm);

    [self.artistFetcher fetchArtistsWithName:searchTerm completionHandler:^(NSArray * _Nullable artists, NSError * _Nullable error) {
        NSLog(@"Found %ld results!", artists.count);

        self.artist = [artists firstObject];
        [self updateViews];
    }];
}

@end
