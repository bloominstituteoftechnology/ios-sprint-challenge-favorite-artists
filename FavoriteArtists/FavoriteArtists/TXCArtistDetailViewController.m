//
//  TXCArtistDetailViewController.m
//  FavoriteArtists
//
//  Created by Thomas Cacciatore on 7/19/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

#import "TXCArtistDetailViewController.h"
#import "TXCArtistController.h"
#import "TXCArtist.h"

@interface TXCArtistDetailViewController ()
@end

@implementation TXCArtistDetailViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    _searchBar.delegate = self;
    [self updateViews];
}

- (void)setArtist:(TXCArtist *)artist {
    if (artist != _artist) {
        _artist = artist;
        [self updateViews];
    }
}

- (void)updateViews {
    if (!self.isViewLoaded || !self.artist) { return; }
    self.title = self.artist.name;
    self.artistNameLabel.text = self.artist.name;
    self.biographyTextView.text = self.artist.biography;
    self.dateFormedLabel.text = [NSString stringWithFormat:@"%d", self.artist.dateFormed];
    
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    NSLog(@"SEARCH BAR CLICKED!!");
    NSString *searchTerm = searchBar.text;
    [_artistController fetchArtistWithName:searchTerm completionBlock:^(NSArray * _Nonnull artists, NSError * _Nonnull error) {
        if (error) {
        NSLog(@"Error: %@", error);
        return;
        }
        for (TXCArtist *artist in artists) {
            NSLog(@"Artist: \n%@", artist.name);
        }
        self.artist = artists[0];
        [self updateViews];
    }];
}

- (IBAction)saveButtonTapped:(id)sender {
    
    //Add artist object to artists array.
    //Save to persistent store
    //pop back to TVC.
    
}


@end
