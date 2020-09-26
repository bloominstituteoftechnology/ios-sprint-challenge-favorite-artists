//
//  SearchDetailViewController.m
//  FavoriteArtists
//
//  Created by Clayton Watkins on 9/25/20.
//

#import "SearchDetailViewController.h"
#import "Artist.h"
#import "ArtistFetcher.h"
#import "ArtistPersistenceController.h"

@interface SearchDetailViewController ()

@property ArtistFetcher *artistFetcher;


@property (nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (nonatomic) IBOutlet UILabel *bandLabel;
@property (nonatomic) IBOutlet UILabel *yearLabel;
@property (nonatomic) IBOutlet UITextView *bioTextView;

@end

@implementation SearchDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.artistFetcher = [[ArtistFetcher alloc] init];
    
    self.searchBar.delegate = self;
    
    if (self.isShowingFavoriteArtistDetail) {
        [self.searchBar removeFromSuperview];
        self.navigationItem.title = self.artist.artistName;
        self.navigationItem.rightBarButtonItem = nil;
    }
    [self updateViews];
}

- (IBAction)saveButtonTapped:(id)sender
{
    if (self.artist == nil) return ;
    [self.persistenceController addArtist:self.artist];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)updateViews
{
    if (self.artist != nil) {
        self.bandLabel.text = self.artist.artistName;
        self.bioTextView.text = self.artist.artistBio;
        
        if (self.artist.yearFormed != 0) {
            NSString *yearFormedString = [NSString stringWithFormat:@"Formed in %d", self.artist.yearFormed];
            self.yearLabel.text = yearFormedString;
        } else {
            self.yearLabel.text = @"Unknown Label";
        }
    } else {
        self.bandLabel.text = nil;
        self.bioTextView.text = nil;
        self.yearLabel.text = nil;
    }
}

@end

@implementation SearchDetailViewController(UISearchBarDelegate)

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *searchTerm = searchBar.text;
    if ((searchTerm == nil) | [searchTerm isEqualToString:@""]) return;
    
    NSLog(@"Searching for %@", searchTerm);
    
    [self.artistFetcher fetchArtistWithName:searchTerm completionHandler:^(NSArray * _Nullable artists, NSError * _Nullable error)
    {
        NSLog(@"Found %ld results!", artists.count);
        
        if (artists.count > 0) {
            self.artist = artists[0];
        }
        
        [self updateViews];
    }];
}

@end
