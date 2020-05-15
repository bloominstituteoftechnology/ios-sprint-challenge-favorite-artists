//
//  ViewController.m
//  FavoriteArtists
//
//  Created by Shawn Gee on 5/15/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

#import "ViewController.h"
#import "LSIAudioDBClient.h"

@interface ViewController ()

@property LSIAudioDBClient *audioDBClient;

- (void)setUp;

@end

@implementation ViewController


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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISearchController *search = [[UISearchController alloc] initWithSearchResultsController:nil];
    search.searchResultsUpdater = self;
    search.obscuresBackgroundDuringPresentation = false;
    search.searchBar.placeholder = @"Search for an artist";
    search.searchBar.delegate = self;
    self.navigationItem.searchController = search;

    
    // Test Fetch
    
    
    
}

// MARK: - Search Results Updating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
}

// MARK: - Search Bar Delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *query = searchBar.text;
    
    if (query && query != nil) {
        [self.audioDBClient fetchArtistsForQuery:query completion:^(NSArray<LSIArtist *> * _Nullable artists, NSError * _Nullable error) {
            NSLog(@"%lu", artists.count);
        }];
    }
}

@end
