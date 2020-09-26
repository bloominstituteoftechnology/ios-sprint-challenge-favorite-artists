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

}

- (void)updateViews
{

}

- (IBAction)saveArtist:(UIBarButtonItem *)sender {

}

@end

@implementation JSKAddArtistViewController(UISearchBarDelegate)

- (void)searchBarClicked:(UISearchBar *)artistSearchBar
{
    NSString *searchTerm = artistSearchBar.text;
    if ((searchTerm == nil) | [searchTerm isEqualToString:@""]) return;
    NSLog(@"Searching for searchTerm: %@", searchTerm);

    [self.fetchArtist fetchArtistWithName:searchTerm fetchArtistWithCompletionHandler:^(NSArray * _Nullable artist, NSError * _Nullable error) {
        NSLog(@"Found %ld results!", artist.count);

        if (artist.count > 0) {
            self. = artist[0];
        }

    }];
    
}

@end
