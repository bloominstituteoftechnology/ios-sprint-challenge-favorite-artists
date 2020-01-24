//
//  LSIArtistsTableViewController.m
//  Favorite Artists
//
//  Created by macbook on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSIArtistsTableViewController.h"
#import "LSISearchArtistViewController.h"
#import "LSIArtistController.h"
#import "LSIArtist.h"

@interface LSIArtistsTableViewController ()

@end

@implementation LSIArtistsTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
    
    self = [super initWithCoder:coder];
    if (self) {
        
        _artistController = [[LSIArtistController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistController.favoriteArtists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    LSIArtist *artist = self.artistController.favoriteArtists[indexPath.row];
    NSNumber *yearNumber = [NSNumber numberWithInt:artist.yearFormed];
    
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = [yearNumber stringValue];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        LSIArtist *artist = self.artistController.favoriteArtists[indexPath.row];
        [self.artistController deleteArtist:artist];
        
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"SearchNewArtistSegue"]) {
        
        LSISearchArtistViewController *searchArtistVC = (LSISearchArtistViewController *)[segue destinationViewController];
        
        searchArtistVC.artistController = self.artistController;
        
    } else if ([segue.identifier isEqualToString:@"ShowArtistDetailSegue"]) {
        
        LSISearchArtistViewController *artistDetailVC = (LSISearchArtistViewController *)[segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        LSIArtist *artist = self.artistController.favoriteArtists[indexPath.row];
        
        artistDetailVC.artistController = self.artistController;
        artistDetailVC.artist = artist;
    }
}

@end
