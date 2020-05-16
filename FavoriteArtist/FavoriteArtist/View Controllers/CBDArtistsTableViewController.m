//
//  CBDArtistsTableViewController.m
//  FavoriteArtist
//
//  Created by Christopher Devito on 5/15/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

#import "CBDArtistsTableViewController.h"
#import "CBDArtistFetcher.h"
#import "CBDArtist.h"
#import "CBDDetailViewController.h"

@interface CBDArtistsTableViewController ()

//MARK: - Private Properties
@property (nonatomic) NSMutableArray *artists;

@end

@implementation CBDArtistsTableViewController

// MARK: - Properties

- (CBDArtistFetcher *)fetcher {
    if (!_fetcher) {
        _fetcher = [[CBDArtistFetcher alloc] initWithArtists:[NSMutableArray new]];
    }
    return _fetcher;
}


// MARK: - View Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.fetcher loadFromDisk];
}

-(void)updateViews {
    [self.tableView reloadData];
}

//MARK: - IBActions
- (IBAction)addNewArtist:(id)sender {
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.fetcher.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    CBDArtist *artist = self.fetcher.artists[indexPath.row];
    cell.textLabel.text = artist.strArtist;
    NSString *detail;
    if (artist.yearFormed == 0) {
        detail = @"Formed in: N/A";
    } else {
        detail = [NSString stringWithFormat:@"Formed in: %d", artist.yearFormed];
    }
    cell.detailTextLabel.text = detail;

    return cell;
}

// MARK: - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"AddArtistSegue"]) {
        CBDDetailViewController *addArtistVC = [segue destinationViewController];
        addArtistVC.fetcher = self.fetcher;
    } else if ([[segue identifier] isEqualToString:@"ArtistDetailSegue"]) {
        CBDDetailViewController *detailVC = [segue destinationViewController];
        detailVC.fetcher = self.fetcher;
        NSIndexPath *index = [self.tableView indexPathForSelectedRow];
        detailVC.artist = self.fetcher.artists[index.row];
    }
}

- (IBAction)unwindSegue:(UIStoryboardSegue *)segue {
    [self updateViews];
}

@end
