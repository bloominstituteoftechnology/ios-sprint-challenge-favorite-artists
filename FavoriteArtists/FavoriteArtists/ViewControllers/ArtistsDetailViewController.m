//
//  ArtistsDetailViewController.m
//  FavoriteArtists
//
//  Created by John McCants on 2/18/21.
//

#import "ArtistsDetailViewController.h"
#import "ArtistModelController.h"
#import "Artist.h"

@interface ArtistsDetailViewController () <UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *artistDescriptionTextView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;


@end

@implementation ArtistsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
    [self properViewLoaded];
    _saveButton.enabled = false;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *searchTerm = searchBar.text;
    
    if (searchTerm) {
        NSLog(@"We got a search term now we are going to fetch artist");
        [ArtistModelController fetchArtist:searchTerm completionHandler:^(Artist *artist, NSError *error)
         {
            NSLog(@"We got a search term and now we're gonna check for artist");
            if (artist) {
                self.artist = artist;
                self.saveButton.enabled = true;
                [self updateViews];
            } else {
            NSLog(@"We don't have an artist");
            [self presentAlert];
            }
        }];
    }
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    [self.artistModelController.artists addObject:self.artist];
    [self.navigationController popViewControllerAnimated:true];
    [self.artistModelController saveToPersistentStore];
}

-(void)presentAlert
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Sorry we got no artists" message:@"Nothing to see here. Try again" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:true completion:nil];
}

-(void) updateViews
{
    //Checking to make sure we have an artist
    if (self.artist) {
        NSLog(@"4. We have an artist");
        self.title = self.artist.artistName;
        int yearFormedInt = self.artist.yearFormed;
        NSString *yearFormedString = [NSString stringWithFormat:@"%i", yearFormedInt];
        self.yearFormedLabel.text = yearFormedString;
        self.artistNameLabel.text = self.artist.artistName;
        self.artistDescriptionTextView.text = self.artist.bioText;
    }
    
}


-(void) properViewLoaded {
    if (self.artist) {
        NSLog(@"properViewLoaded called");
        _searchBar.hidden = true;
    } else {
        _searchBar.hidden = false;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
