//
//  CLBArtistTableViewController.m
//  Favorite Artists
//
//  Created by Christian Lorenzo on 5/30/20.
//  Copyright © 2020 Christian Lorenzo. All rights reserved.
//

#import "CLBArtistTableViewController.h"
#import "CLBArtists.h"
#import "CLBArtistsController.h"
#import "CLBArtistDetailViewController.h"

@interface CLBArtistTableViewController ()

@property (nonatomic) CLBArtistsController *artistController;
@property (nonatomic) NSMutableArray *savedArtist;

@end

@implementation CLBArtistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *tempArtists = [self.artistController fetchSavedArtists];
    self.savedArtist = [[NSMutableArray alloc] initWithArray:tempArtists];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSArray *tempArtist = [self.artistController fetchSavedArtists];
    self.savedArtist = [[NSMutableArray alloc] initWithArray:tempArtist];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.savedArtist.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    CLBArtists *artist = self.savedArtist[indexPath.row];
    
    if (artist.yearFormed == 0) {
        cell.detailTextLabel.text = @"N/A";
    } else {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];
    }
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddArtistsSegue"]) {
        CLBArtistDetailViewController *controller = (CLBArtistDetailViewController *)segue.destinationViewController;
        controller.artistController = self.artistController;
        
    }
    
    if ([segue.identifier isEqualToString:@"CellToViewControllerSegue"]) {
        CLBArtistDetailViewController *controller = (CLBArtistDetailViewController *)segue.destinationViewController;
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        controller.artist = self.savedArtist[selectedIndexPath.row];
    }
}

- (CLBArtistsController *)artistController {
    if (!_artistController) {
        _artistController = [[CLBArtistsController alloc] init];
    }
    
    return _artistController;
}

@end
