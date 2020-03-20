//
//  JLADetailViewController.m
//  FavoriteArtistsSprint
//
//  Created by Jorge Alvarez on 3/20/20.
//  Copyright © 2020 Jorge Alvarez. All rights reserved.
//

#import "JLADetailViewController.h"
#import "JLAFavoriteArtistController.h"

@interface JLADetailViewController () <UISearchBarDelegate>
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (strong, nonatomic) IBOutlet UITextView *textView;

@property (nonatomic) JLAFavoriteArtistController *favoriteArtistController;

@end

@implementation JLADetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.favoriteArtistController = [[JLAFavoriteArtistController alloc] init];
    self.searchBar.delegate = self;
    // Do any additional setup after loading the view.
}
- (IBAction)saveTapped:(UIBarButtonItem *)sender {
    NSLog(@"Save Tapped");
    // do work
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    //Do search logic here
    NSString *searchTerm = searchBar.text;
    NSLog(@"searchTerm%@", searchTerm);
    [self.favoriteArtistController fetchFavoriteArtistByName:searchTerm completion:^(JLAFavoriteArtist *favoriteArtist) {
       dispatch_async(dispatch_get_main_queue(), ^{
           NSLog(@"search result = %@", favoriteArtist);
           //self.title = favoriteArtist.strArtist;
           
        });
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

@end
