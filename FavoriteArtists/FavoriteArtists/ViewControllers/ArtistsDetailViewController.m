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
    _saveButton.enabled = false;
}
- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    [self.artistModelController.artists addObject:self.artist];
    [self.navigationController popViewControllerAnimated:true];
}

-(void) updateViews {
    //Checking to make sure we have an artist
    if (self.artist) {
        self.title = self.artist.artistName;
        int yearFormedInt = self.artist.yearFormed;
        NSString *yearFormedString = [NSString stringWithFormat:@"%i", yearFormedInt];
        self.yearFormedLabel.text = yearFormedString;
        self.artistDescriptionTextView.text = self.artist.bioText;
    }
    
}


-(void) properViewLoaded {
    if (self.artist) {
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
