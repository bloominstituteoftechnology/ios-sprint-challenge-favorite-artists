//
//  MJSArtistDetailViewController.m
//  FavoriteArtists
//
//  Created by Morgan Smith on 9/27/20.
//

#import "MJSArtistDetailViewController.h"
#import "MJSArtist.h"
#import "MJSArtistController.h"
#import "MJSArtist+NSJSONSerialization.h"

@interface MJSArtistDetailViewController ()<UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormed;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@property (nonatomic) MJSArtist *artistSearch;
@property (nonatomic) BOOL isArtist;

@end

@implementation MJSArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.searchBar.delegate = self;

    if (self.artist == nil) {
        self.isArtist = NO;
        self.artistLabel.hidden = YES;
        self.yearFormed.hidden = YES;
        self.biographyTextView.hidden = YES;
    } else {
        self.isArtist = YES;
        [self updateViews];
    }

}

- (void)updateViews {
    if (self.isArtist == YES) {
        self.searchBar.hidden = YES;
        self.title = self.artist.artist;
        self.artistLabel.hidden = YES;
        self.yearFormed.hidden = NO;
        self.biographyTextView.hidden = NO;

        if (self.artist.yearFormed == 0) {
            self.yearFormed.text = @"N/A";
        } else {
            self.yearFormed.text = [NSString stringWithFormat:@"Formed in %d", self.artist.yearFormed];
        }
        self.biographyTextView.text = self.artist.biography;
    } else {
        self.artistLabel.hidden = NO;
        self.yearFormed.hidden = NO;
        self.biographyTextView.hidden = NO;

        self.artistLabel.text = self.artistSearch.artist;

        if (self.artistSearch.yearFormed == 0) {
            self.yearFormed.text = @"N/A";
        } else {
            self.yearFormed.text = [NSString stringWithFormat:@"Formed in %d", self.artistSearch.yearFormed];
        }

        self.biographyTextView.text = self.artistSearch.biography;
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.artistController fetchArtistsWithName:searchBar.text completion:^(MJSArtist * _Nullable artist, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching artist!");
        }

        NSLog(@"Fetched artist: %@", artist);
        self.artistSearch = artist;

        dispatch_async(dispatch_get_main_queue(), ^ {
            [self updateViews];
        });
    }];
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    if (self.artistSearch == nil) {
        return;
    }

    NSData *data = [NSJSONSerialization dataWithJSONObject:[self.artistSearch toDictionary] options:0 error:nil];
    NSURL *directory = [[NSFileManager defaultManager] URLForDirectory: NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];

    NSURL *url = [[directory URLByAppendingPathComponent:self.artistSearch.artist] URLByAppendingPathExtension:@"json"];

    NSLog(@"Directory: %@", directory);
    NSLog(@"UR: %@", url);

    [data writeToURL:url atomically:YES];
    [self.navigationController popToRootViewControllerAnimated:true];
}

@end
