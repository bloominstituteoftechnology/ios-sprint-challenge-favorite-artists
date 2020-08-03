//
//  AddNewArtistViewController.m
//  FavoriteArtists
//
//  Created by Sean Acres on 8/2/20.
//  Copyright © 2020 Sean Acres. All rights reserved.
//

#import "AddNewArtistViewController.h"
#import "ArtistFetcher.h"
#import "SMAFavoriteArtist.h"

@interface AddNewArtistViewController () <UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistFormationDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistBiographyLabel;

@property (nonatomic)ArtistFetcher *artistFetcher;
@property (nonatomic)SMAFavoriteArtist *favoriteArtist;

@end

@implementation AddNewArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchBar.delegate = self;
}

- (IBAction)saveArtistTapped:(id)sender {
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    if (!searchBar.text) {
        return;
    }
    
    [self.artistFetcher fetchArtistsWithArtistName:searchBar.text completionHandler:^(NSArray * _Nullable artists, NSError * _Nullable error) {
        NSLog(@"Got this error %@", error);
        NSLog(@"Got this artist %@", artists.firstObject);
        self.favoriteArtist = artists.firstObject;
        [self updateViews];
    }];
}

- (void)updateViews
{
    self.artistNameLabel.text = self.favoriteArtist.artistName;
    self.artistFormationDateLabel.text = [NSString stringWithFormat:@"%.0f", self.favoriteArtist.formationDate];
    self.artistBiographyLabel.text = self.favoriteArtist.biography;
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
