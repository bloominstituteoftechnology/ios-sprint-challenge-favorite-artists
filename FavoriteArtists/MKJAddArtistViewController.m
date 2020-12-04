//
//  MKJAddArtistViewController.m
//  FavoriteArtists
//
//  Created by Kenneth Jones on 12/3/20.
//

#import "MKJAddArtistViewController.h"

@interface MKJAddArtistViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *artistSearchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *biographyLabel;

@property (nonatomic) NSString *artistName;
@property (nonatomic) int year;
@property (nonatomic) NSString *biography;

@end

@implementation MKJAddArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _artistSearchBar.delegate = self;
    _artistLabel.text = @"";
    _yearLabel.text = @"";
    _biographyLabel.text = @"";
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.fetcher fetchArtistWithArtist:searchBar.text completionHandler:^(MKJArtist *artist, NSError *error) {
        self.artistLabel.text = artist.artist;
        self.artistName = artist.artist;
        self.yearLabel.text = [NSString stringWithFormat:@"Formed in %i", artist.year];
        self.year = artist.year;
        self.biographyLabel.text = artist.biography;
        self.biography = artist.biography;
    }];
}

- (IBAction)saveArtist:(id)sender {
    if ([self.artistLabel.text isEqualToString:@""]) {
        [self.navigationController popViewControllerAnimated:true];
    } else {
        MKJArtist *artistInfo = [[MKJArtist alloc] initWithArtist:_artistName year:_year biography:_biography];
        [self.fetcher saveArtist:artistInfo];
        [self.navigationController popViewControllerAnimated:true];
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
