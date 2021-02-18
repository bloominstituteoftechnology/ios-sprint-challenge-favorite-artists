//
//  SAEDetialArtistViewController.m
//  ScreenRecording-Sprint
//
//  Created by Sammy Alvarado on 11/21/20.
//

#import "SAEArtist.h"
#import "SAEArtistController.h"
#import "SAEDetialArtistViewController.h"

@interface SAEDetialArtistViewController ()

@property (nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic) IBOutlet UILabel *artistNameLabel;
@property (nonatomic) IBOutlet UILabel *dateFormedLabel;
@property (nonatomic) IBOutlet UITextView *artistDetialTextView;

@end

@implementation SAEDetialArtistViewController

@synthesize artistController;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBar setDelegate:self];
    [self updateView];
    _searchBar.delegate = self;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *searchTerm = searchBar.text;
    [self.artistController searchArtist:searchTerm completionHandler:^(SAEArtist *artist, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Artis: %@, Error: %@", artist.artistName, error);
            self.artist = artist;
            [self updateView];
            
        });
    }];
}

- (void)updateView
{
    if (self.artist) {
        self.artistNameLabel.text = self.artist.artistName;
        self.artistDetialTextView.text = self.artist.biography;
        
        if (self.artist.formedYear > 0) {
            self.dateFormedLabel.text = [NSString stringWithFormat:@"%d", self.artist.formedYear];
        } else {
            self.dateFormedLabel.text = @"Year unkown";
        }
    }
}

- (IBAction)saveButton:(id)sender {
    if(self.artist) {
        NSLog(@"saveTapped");
        [self.artistController addArtists:self.artist];
        [self.navigationController popViewControllerAnimated:true];
    }
}



@end
