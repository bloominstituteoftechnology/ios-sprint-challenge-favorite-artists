//
//  ViewController.m
//  FavoriteArtists
//
//  Created by Shawn Gee on 5/15/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

#import "LSIAddArtistViewController.h"
#import "LSIAudioDBClient.h"
#import "LSIArtist.h"

@interface LSIAddArtistViewController ()

@property LSIAudioDBClient *audioDBClient;
@property LSIArtist *artist;

// MARK: - IBOutlets

@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *artistYearLabel;
@property (strong, nonatomic) IBOutlet UITextView *artistBioTextView;

- (void)setUp;
- (void)setUpSearchbar;
- (void)updateUI;

@end

@implementation LSIAddArtistViewController


// MARK: - Init

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    self.audioDBClient = [[LSIAudioDBClient alloc] init];
}

// MARK: - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSearchbar];
}

// MARK: - Private Methods

- (void)setUpSearchbar {
    UISearchController *search = [[UISearchController alloc] initWithSearchResultsController:nil];
    search.searchResultsUpdater = self;
    search.obscuresBackgroundDuringPresentation = false;
    search.searchBar.placeholder = @"Search for an artist";
    search.searchBar.delegate = self;
    self.navigationItem.searchController = search;
}

- (void)updateUI {
    if (self.artist) {
        self.artistNameLabel.text = self.artist.name;
        self.artistYearLabel.text = [NSString stringWithFormat: @"%d", self.artist.yearFormed];
        self.artistBioTextView.text = self.artist.biography;
    } else {
        self.artistNameLabel.text = @"No Results";
        self.artistYearLabel.text = @"";
        self.artistBioTextView.text = @"";
    }
}

// MARK: - Search Results Updating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
}

// MARK: - Search Bar Delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *query = searchBar.text;
    
    if (query && query != nil) {
        [self.audioDBClient fetchArtistsForQuery:query completion:^(NSArray<LSIArtist *> * _Nullable artists, NSError * _Nullable error) {
            if (artists.count >= 1) {
                self.artist = artists[0];
            } else {
                self.artist = nil;
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateUI];
                if (self.artist) {
                    searchBar.text = @"";
                }
                [self.navigationItem.searchController dismissViewControllerAnimated:true completion:nil];
            });
        }];
    }
}

@end

