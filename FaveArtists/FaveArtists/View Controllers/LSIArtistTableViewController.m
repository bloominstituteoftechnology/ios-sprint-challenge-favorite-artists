//
//  LSIArtistTableViewController.m
//  FaveArtists
//
//  Created by John Pitts on 7/19/19.
//  Copyright © 2019 johnpitts. All rights reserved.
//

#import "LSIArtistTableViewController.h"
#import "LSIDetailViewController.h"
#import "LSIArtist.h"
#import "LSIArtistController.h"
#import "LSIDetailViewController.h"


@interface LSIArtistTableViewController ()

@end

@implementation LSIArtistTableViewController


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Swift artistController = artistController
    // How do i get either internalBands or bands to not be nil?
    
    [self.tableView reloadData];
}

// Retrieves a working copy of artistController to extract saved "bands" array for showing table
- (LSIArtistController *)artistController {

    if(!_artistController) {
        _artistController = [[LSIArtistController alloc] init];
    }
    // This line here could be the source of the nilling, using breakpoint to see
    return _artistController;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistController.countOfArtists;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    LSIArtist *artist = self.artistController.bands[indexPath.row];
    cell.textLabel.text = artist.strArtist;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld", artist.intFormedYear];
    
    return cell;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"ArtistDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        LSIArtist *artist = self.artistController.bands[indexPath.row];
        LSIDetailViewController *detailVC = segue.destinationViewController;
        
        detailVC.artistController = self.artistController;
        detailVC.artist = artist;
        
    } else if ([segue.identifier isEqualToString:@"AddArtist"]) {
        LSIDetailViewController *detailVC = segue.destinationViewController;
        detailVC.artistController = self.artistController;
    }
    
}
@end
