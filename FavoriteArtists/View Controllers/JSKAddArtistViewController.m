//
//  JSKAddArtistViewController.m
//  FavoriteArtists
//
//  Created by Josh Kocsis on 9/25/20.
//

#import "JSKAddArtistViewController.h"
#import "JSKArtist.h"
#import "JSKArtist+NSJSONSerialization.h"
#import "JSKArtistController.h"
#import "JSKArtistResults.h"
#import "JSKFetchArtistController.h"
#import "JSKArtistTableViewController.h"


@interface JSKAddArtistViewController ()

@property JSKFetchArtistController *fetchArtist;

@property (strong, nonatomic) IBOutlet UISearchBar *artistSearchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (strong, nonatomic) IBOutlet UITextView *artistBioTextView;

@end

@implementation JSKAddArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.fetchArtist = [[JSKFetchArtistController alloc] init];
    self.artistSearchBar.delegate = self;
    [self updateViews];

}

- (void)updateViews
{
    if (self.artist != nil) {
        self.artistNameLabel.text = self.artist.artistName;
        self.artistBioTextView.text = self.artist.artistBio;

        if (self.artist.yearFormed !=0) {
            NSString *yearFormedString = [NSString stringWithFormat:@"Formed in %@", self.artist.yearFormed];
            self.yearFormedLabel.text = yearFormedString;
        } else {
            self.yearFormedLabel.text = @"Year Not Known";
        }
    } else {
        self.artistNameLabel.text = nil;
        self.artistBioTextView.text = nil;
        self.yearFormedLabel.text = nil;
    }
}

- (IBAction)saveArtist:(UIBarButtonItem *)sender
{
    if (self.artist == nil) return;
    [self.artistController addArtist:self.artist];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)artistSearchBar
{
    NSString *searchTerm = artistSearchBar.text;
    if ((searchTerm == nil) | [searchTerm isEqualToString:@""]) return;
    NSLog(@"Searching for searchTerm: %@", searchTerm);

    [self.fetchArtist fetchArtistWithName:searchTerm fetchArtistWithCompletionHandler:^(NSArray * _Nullable artist, NSError * _Nullable error) {
        NSLog(@"Found %ld results!", artist.count);

        if (artist.count > 0) {
            self.artist = artist[0];
        }

        [self updateViews];
    }];
}

@end
