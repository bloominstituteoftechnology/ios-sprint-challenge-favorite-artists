//
//  FavoriteArtistsTableViewController.m
//  FavoriteArtists
//
//  Created by Kelson Hartle on 8/2/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

#import "FavoriteArtistsTableViewController.h"
#import "ArtistDetailViewController.h"
#import "LSIArtistController.h"
#import "LSIArtist.h"

@interface FavoriteArtistsTableViewController ()

// MARK: - Properties
@property (nonatomic) LSIArtistController *fetcher;
@property NSMutableArray *savedArtists;

// MARK: - Outlets
@property (weak, nonatomic) IBOutlet UITableView *tableView;

-(void)compileArtists;

@end

@implementation FavoriteArtistsTableViewController

// MARK: - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self compileArtists];
    
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    
    [self compileArtists];

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.tableView reloadData];
    
    [self compileArtists];

}

- (void)compileArtists {
    NSArray *newArtists = [self.fetcher fetchSavedArtist];
    self.savedArtists = [[NSMutableArray alloc] initWithArray:newArtists];
    
}


// MARK: - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SearchArtistSegue"]) {
        ArtistDetailViewController * fetcher = (ArtistDetailViewController *)segue.destinationViewController;
        fetcher.fetcher = self.fetcher;
    }
    
    if ([segue.identifier isEqualToString:@"ShowDetailSegue"]) {
        ArtistDetailViewController *controller = (ArtistDetailViewController *) segue.destinationViewController;
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        controller.artist = self.savedArtists[selectedIndexPath.row];
    }
}

// MARK: - TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.savedArtists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    LSIArtist *artist = self.savedArtists[indexPath.row];
    cell.textLabel.text = artist.artistName;
    
    return cell;
}

- (LSIArtistController *)fetcher {
    if (!_fetcher) {
        _fetcher = [[LSIArtistController alloc] init];
    }
    return _fetcher;
}


@end
