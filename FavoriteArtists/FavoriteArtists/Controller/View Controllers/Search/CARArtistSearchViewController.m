//
//  CARArtistSearchViewController.m
//  FavoriteArtists
//
//  Created by Chad Rutherford on 2/21/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import "CARArtistSearchViewController.h"
#import "CARCoreDataStack.h"
#import "CARArtistFetcher.h"
#import "CARFavoriteArtist.h"

@interface CARArtistSearchViewController ()

// --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
// MARK: - Outlets
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

// --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
// MARK: - Properties
@property (nonatomic) CARCoreDataStack *stack;
@property (nonatomic) CARArtistFetcher *fetcher;
@property (nonatomic) CARFavoriteArtist *artist;

@end

@implementation CARArtistSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    self.stack = [[CARCoreDataStack alloc] init];
}

- (void)updateViews {
    self.artistNameLabel.text = self.artist.name;
    if (self.artist.yearFormed == 0) {
        self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in %@", @"N/A"];
    } else {
        self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in %d", self.artist.yearFormed];
    }
    self.biographyTextView.text = self.artist.biography;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    self.fetcher = [[CARArtistFetcher alloc] init];
    [self.fetcher fetchArtistForSearchString:searchBar.text completion:^(CARFavoriteArtist * _Nullable artist, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error: %@", error);
            return;
        }
        
        self.artist = artist;
        self.searchBar.text = @"";
        [self updateViews];
    }];
}

@end
