//
//  CLPAddNewArtistViewController.m
//  FavoriteArtists
//
//  Created by Chad Parker on 7/31/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

#import "CLPAddNewArtistViewController.h"
#import "CLPArtistInfoViewController.h"
#import "CLPArtist.h"
#import "CLPArtistController.h"

@interface CLPAddNewArtistViewController ()

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property (nonatomic) CLPArtist *artist;

@end

@interface CLPAddNewArtistViewController (UISearchBarDelegate) <UISearchBarDelegate>

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;

@end

@implementation CLPAddNewArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.searchBar.delegate = self;

    self.artist = [[CLPArtist alloc] init];
}

- (IBAction)save:(UIBarButtonItem *)sender {

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CLPArtistInfoViewController *infoVC = [segue destinationViewController];
    infoVC.artist = self.artist;
}

@end

@implementation CLPAddNewArtistViewController (UISearchBarDelegate)

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.artistController fetchArtistForQuery:searchBar.text :^(CLPArtist * _Nullable artist, NSError * _Nullable error) {
        
    }];
}

@end
