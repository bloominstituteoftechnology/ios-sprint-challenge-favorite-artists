//
//  ArtistsViewController.m
//  FavoriteArtists
//
//  Created by Alex Thompson on 5/30/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSIArtistsDetailViewController.h"
#import "LSIArtists.h"
#import "LSIArtistsController.h"
#import "LSIArtist+NSJSONSerialization.h"

@interface LSIArtistsDetailViewController ()<UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearFormed;
@property (strong, nonatomic) IBOutlet UITextView *biographyTextView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@property (nonatomic) LSIArtists *artistSearch;
@property (nonatomic) BOOL isArtist;

@end

@implementation LSIArtistsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    
    if (self.artist == nil) {
        self.isArtist = NO;
        [self hideViews];
    } else {
        self.isArtist = YES;
        [self updateViews];
    }
}

- (void)hideViews {
    self.artistLabel.hidden = YES;
    self.yearFormed.hidden = YES;
    self.biographyTextView.hidden = YES;
}

- (void)updateViews {
    
    if (self.isArtist == YES) {
        self.searchBar.hidden = YES;
        self.title = self.artist.artist;
        
        self.artistLabel.hidden = NO;
        self.yearFormed.hidden = NO;
        self.biographyTextView.hidden = NO;
        
        self.artistLabel.text = self.artist.artist;
        
        if (self.artist.yearFormed == 0) {
            self.yearFormed.text = @"N/A";
        } else {
            self.yearFormed.text = [NSString stringWithFormat:@"Formed in $d", self.artist.yearFormed];
        }
        
        self.biographyTextView.text = self.artist.biography;
        
    } else {
        
        self.artistLabel.hidden = NO;
        self.yearFormed.hidden = NO;
        self.biographyTextView.hidden = NO;
        
        self.artistLabel.text = self.artistSearch.artist;
        
        if (self.artistSearch.yearFormed == 0) {
            self.yearFormed.text = @"N/A";
        } else {
            self.yearFormed.text = [NSString stringWithFormat:@"Formed in %d", self.artistSearch.yearFormed];
        }
        self.biographyTextView.text = self.artistSearch.biography;
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.artistController fetchArtistWithName:searchBar.text completion:^(LSIArtists * _Nullable artist, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching: ");
            return;
        }
        
        NSLog(@"Fetched artist: %@", artist);
        self.artistSearch = artist;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self updateViews];
        });
    }];
}



@end
