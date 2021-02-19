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
    
    // Do any additional setup after loading the view.
}
- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:true];
}

-(void) updateViews {
    _saveButton.enabled = false;
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
