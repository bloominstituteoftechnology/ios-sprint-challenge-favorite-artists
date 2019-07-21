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
#import "TXCArtist+TXCArtist_NSJSONSerialization.h"

@interface TXCArtistDetailViewController ()
@end

@implementation TXCArtistDetailViewController



- (void)viewDidLoad {
    [super viewDidLoad];
//    _artistController = [[TXCArtistController alloc] init];
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
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (!self.isViewLoaded || !self.artist) { return; }
        self.title = self.artist.name;
        self.artistNameLabel.text = self.artist.name;
        self.biographyTextView.text = self.artist.biography;
        NSString *formedOn = [NSString stringWithFormat:@"%d", self.artist.dateFormed];
        self.dateFormedLabel.text = formedOn;
    });
    
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    NSLog(@"SEARCH BAR CLICKED!!");
    NSString *searchTerm = searchBar.text;
    [self.artistController fetchArtistWithName:searchTerm completionBlock:^(NSArray * _Nonnull artists, NSError * _Nonnull error) {
        if (error) {
        NSLog(@"Error: %@", error);
        return;
        }
        for (TXCArtist *artist in artists) {
            NSLog(@"Artist: \n%@", artist.name);
        }
        self.artist = [[TXCArtist alloc] init];
        self.artist = artists[0];
        
        [self updateViews];
        
    }];
}

- (IBAction)saveButtonTapped:(id)sender {
    
    //Add artist object to artists array.
    
//    [self.artistController.artists addObject:_artist];
    //Save to persistent store
    //converts artist to dictionary.
//    [_artist toDictionary];
    [self.navigationController popViewControllerAnimated:YES];

    //pop back to TVC.
    
}


@end
