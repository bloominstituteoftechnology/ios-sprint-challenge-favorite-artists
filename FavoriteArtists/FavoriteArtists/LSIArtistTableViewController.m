//
//  LSIArtistTableViewController.m
//  FavoriteArtists
//
//  Created by Alex Thompson on 5/30/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSIArtistTableViewController.h"
#import "LSIArtists.h"
#import "LSIArtistsController.h"
#import "LSIArtistsDetailViewController.h"

@interface LSIArtistTableViewController ()

@property (nonatomic) LSIArtistsController *artistController;
@property (nonatomic) NSMutableArray *savedArtists;

@end

@implementation LSIArtistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *tempArtists = [self.artistController fetchSavedArtists];
    self.savedArtists = [[NSMutableArray alloc] initWithArray:tempArtists];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSArray *tempArtists = [self.artistController fetchSavedArtists];
    self.savedArtists = [[NSMutableArray alloc] initWithArray:tempArtists];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.savedArtists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    LSIArtists *artist = self.savedArtists[indexPath.row];
    
    if (artist.yearFormed == 0) {
        cell.detailTextLabel.text = @"N/A";
        cell.textLabel.text = artist.artist;
    } else {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];
        cell.textLabel.text = artist.artist;
    }
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"AddSegue"]) {
        LSIArtistsDetailViewController *controller = (LSIArtistsDetailViewController *)segue.destinationViewController;
        controller.artistController = self.artistController;
    }
    
    if ([segue.identifier isEqualToString:@"DetailSegue"]) {
        LSIArtistsDetailViewController *controller = (LSIArtistsDetailViewController *)segue.destinationViewController;
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        controller.artist = self.savedArtists[selectedIndexPath.row];
    }
}

- (LSIArtistsController *)artistController {
    if (!_artistController) {
        _artistController = [[LSIArtistsController alloc] init];
    }
    return _artistController;
}

@end
