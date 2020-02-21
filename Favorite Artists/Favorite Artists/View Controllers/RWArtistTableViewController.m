//
//  RWArtistTableViewController.m
//  Favorite Artists
//
//  Created by Rick Wolter on 2/21/20.
//  Copyright © 2020 Devshop7. All rights reserved.
//

#import "RWArtistTableViewController.h"
#import "RWSearchViewController.h"
#import "RWDetailViewController.h"
#import "RWArtistController.h"

@interface RWArtistTableViewController ()

@end

@implementation RWArtistTableViewController

- (void)viewDidLoad {
        [super viewDidLoad];
        self.artistController = [[RWArtistController alloc] init];
        [self.artistController loadArtists];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.artistController.artists.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
   RWArtist *artist = [self.artistController.artists objectAtIndex:indexPath.row];
        
        cell.textLabel.text = artist.name;
        NSInteger valid = artist.yearFormed;
        if (valid == 0) {
            cell.detailTextLabel.text = @"Formed in: ?";
        } else {
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %li", (long)artist.yearFormed];
        }
        
        return cell;
    }

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SearchForArtistSegue"]) {
        RWSearchViewController *searchVC = segue.destinationViewController;
        searchVC.artistController = self.artistController;
    } else if ([segue.identifier isEqualToString:@"ArtistDetailSegue"]) {
        RWDetailViewController *detailVC = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        detailVC.artist = [self.artistController.artists objectAtIndex:indexPath.row];
    }
}

@end
