//
//  CBDDetailViewController.m
//  FavoriteArtist
//
//  Created by Christopher Devito on 5/15/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

#import "CBDDetailViewController.h"
#import "CBDArtistFetcher.h"
#import "CBDArtist.h"
#import "CBDArtistsTableViewController.h"

@interface CBDDetailViewController ()

// MARK: - Private Properties


// MARK: - IBOutlets
@property (strong, nonatomic) IBOutlet UISearchBar *favoriteArtistSearchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (strong, nonatomic) IBOutlet UITextView *artistDetailsTextView;
@property (strong, nonatomic) IBOutlet UILabel *yearFormedLabel;

@end

@implementation CBDDetailViewController



// MARK: - View Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    //self.favoriteArtistSearchBar = [UISearchBar init];
    self.favoriteArtistSearchBar.delegate = self;
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem.title = @"Save Artist";
    [self updateViews];
}

- (void)updateViews {
    if (self.artist) {
        self.artistNameLabel.text = self.artist.strArtist;
        self.artistDetailsTextView.text = self.artist.strBiographyEN;
        self.title = self.artist.strArtist;
        self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in: %d", self.artist.yearFormed];
        //[self.favoriteArtistSearchBar ] = YES;
    } else {
        self.artistNameLabel.text = @"";
        self.artistDetailsTextView.text = @"";
        self.yearFormedLabel.text = @"";
        self.title = @"Search For Artist";
    }
}

// MARK: - Actions
- (IBAction)saveArtist:(id)sender {
    if (![self.fetcher.artists containsObject:self.artist] && self.artist.strArtist != nil) {
        [self.fetcher saveArtist:self.artist completionBlock:^(CBDArtist * _Nullable artist, NSError * _Nullable error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self performSegueWithIdentifier:@"UnwindToArtistsTVC" sender:self];
            });
        }];
    }
    
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *searchItem = searchBar.text;
    [self.fetcher fetchArtistWithName:searchItem completionBlock:^(CBDArtist * _Nullable artist, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching artist");
            return;
        }
        NSLog(@"Artist: %@", artist.strArtist);
        self.artist = artist;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self updateViews];
        });
    }];
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([[segue identifier] isEqualToString:@"UnwindToArtistsTVC"]) {
//        CBDArtistsTableViewController *artistsTVC = [segue destinationViewController];
//        artistsTVC.fetcher = self.fetcher;
//    }
//}

@end
