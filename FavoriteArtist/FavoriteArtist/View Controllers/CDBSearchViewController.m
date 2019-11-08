//
//  CDBSearchViewController.m
//  FavoriteArtist
//
//  Created by Ciara Beitel on 11/8/19.
//  Copyright © 2019 Ciara Beitel. All rights reserved.
//

#import "CDBSearchViewController.h"

@interface CDBSearchViewController ()

@property NSArray *favArtists;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioLabel;

@end

@implementation CDBSearchViewController

- (void)setFavArtist:(CDBFavArtist *)favArtist {
    _favArtist = favArtist;
    [self updateViews];
}

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
            self.favArtists = _favArtists;
        });
        NSLog(@"Search result: %@", _favArtists);
    }];
}

- (void)updateViews {
    if (!self.favArtist) { return; }
    self.nameLabel.text = self.favArtist.name;
    self.yearLabel.text = self.favArtist.year;
    self.bioLabel.text = self.favArtist.biography;
}
    
@end
