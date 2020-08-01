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
@property (nonatomic) CLPArtistInfoViewController *infoVC;

@end

@interface CLPAddNewArtistViewController (UISearchBarDelegate) <UISearchBarDelegate>

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;

@end

@implementation CLPAddNewArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.searchBar.delegate = self;
}

- (IBAction)save:(UIBarButtonItem *)sender {

}

- (void)setArtist:(CLPArtist *)artist
{
    _artist = artist;
    self.infoVC.artist = self.artist;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CLPArtistInfoViewController *infoVC = [segue destinationViewController];
    self.infoVC = infoVC;
}

- (void)showAlertWithMessage:(NSString *)message
{
    UIAlertController *alertvc = [UIAlertController alertControllerWithTitle:@"Error"
                                                                     message:message
                                                              preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleDefault handler:nil];
    [alertvc addAction:action];
    [self presentViewController:alertvc animated:true completion:nil];
}

@end

@implementation CLPAddNewArtistViewController (UISearchBarDelegate)

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.artistController fetchArtistForQuery:searchBar.text :^(CLPArtist * _Nullable artist, NSError * _Nullable error) {
        if (error) {
            [self showAlertWithMessage:@"Artist not found. Please try again."];
            return;
        }
        if (artist) {
            self.artist = artist;
        } else {
            [self showAlertWithMessage:@"Artist not found. Please try again."];
        }
    }];
}

@end
