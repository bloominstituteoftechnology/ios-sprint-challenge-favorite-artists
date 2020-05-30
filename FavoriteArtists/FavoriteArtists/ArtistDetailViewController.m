//
//  ArtistDetailViewController.m
//  FavoriteArtists
//
//  Created by Jessie Ann Griffin on 5/29/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

#import "ArtistDetailViewController.h"
#import "ArtistFetcher.h"
#import "Artist.h"

@interface ArtistDetailViewController () <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UILabel *biographyLabel;



@end

@implementation ArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *name = searchBar.text;
    ArtistFetcher *fetcher = [[ArtistFetcher alloc] init];
    [fetcher fetchArtistWithName:name
               completionHandler:^(Artist * _Nullable artist, NSError * _Nullable error) {
        NSLog(@"");
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)saveTapped:(UIBarButtonItem *)sender {
}

@end
