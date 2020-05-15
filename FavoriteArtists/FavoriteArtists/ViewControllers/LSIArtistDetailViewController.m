//
//  ViewController.m
//  FavoriteArtists
//
//  Created by Shawn Gee on 5/15/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

#import "LSIArtistDetailViewController.h"
#import "LSIAudioDBClient.h"
#import "LSIArtistController.h"
#import "LSIArtist.h"

@interface LSIArtistDetailViewController ()

@property LSIAudioDBClient *audioDBClient;

// MARK: - IBOutlets

@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *artistYearLabel;
@property (strong, nonatomic) IBOutlet UITextView *artistBioTextView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;

- (void)setUp;
- (void)setUpSearchbar;
- (void)updateUI;

@end

@implementation LSIArtistDetailViewController


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
    _audioDBClient = [[LSIAudioDBClient alloc] init];
}

// MARK: - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!self.artist) {
       [self setUpSearchbar];
    } else {
        [self.saveButton setEnabled:false];
        [self updateUI];
        self.title = self.artist.name;
    }
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
        self.artistYearLabel.text = [NSString stringWithFormat: @"Formed in %d", self.artist.yearFormed];
        self.artistBioTextView.text = self.artist.biography;
    } else {
        self.artistNameLabel.text = @"No Results";
        self.artistYearLabel.text = @"";
        self.artistBioTextView.text = @"";
    }
}

// MARK: - IBActions

- (IBAction)save:(id)sender {
    if (self.artist) {
        [self.artistController addArtist:self.artist];
        [self.navigationController popViewControllerAnimated:true];
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

