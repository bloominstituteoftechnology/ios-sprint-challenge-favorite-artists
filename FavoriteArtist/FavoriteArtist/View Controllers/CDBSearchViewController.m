//
//  CDBSearchViewController.m
//  FavoriteArtist
//
//  Created by Ciara Beitel on 11/8/19.
//  Copyright © 2019 Ciara Beitel. All rights reserved.
//

#import "CDBSearchViewController.h"
#import "CDBFavArtist.h"

@interface CDBSearchViewController ()

@property NSArray *favArtists;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioLabel;

@end

@implementation CDBSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBar setDelegate:self];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.favArtistController searchForFavArtists:searchBar.text completion:^(NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            return;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.favArtists = favArtists;
        });
        NSLog(@"Search result: %@", favArtists);
    }];
}
    
@end
