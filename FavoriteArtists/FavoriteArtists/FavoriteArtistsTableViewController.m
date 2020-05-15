//
//  FavoriteArtistsTableViewController.m
//  FavoriteArtists
//
//  Created by Karen Rodriguez on 5/15/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

#import "FavoriteArtistsTableViewController.h"
#import "HLOArtist.h"
#import "HLOArtistModelController.h"
#import "ArtistDetailViewController.h"

@interface FavoriteArtistsTableViewController ()
// MARK:- Properties

@property (nonatomic) HLOArtistModelController *artistController;

// MARK:- Outlets


@end

@implementation FavoriteArtistsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.artistController = [[HLOArtistModelController alloc] init];
    HLOArtist *testArtist = [[HLOArtist alloc] initWithName:@"Testlemore" artistBiography:@"Was a real gangsta" yearFormed:42069];
    [self.artistController.favoriteArtists addObject:testArtist];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistController.favoriteArtists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FavArtistCell" forIndexPath:indexPath];
    
    // Configure the cell...
    HLOArtist *artist = self.artistController.favoriteArtists[indexPath.row];
    cell.textLabel.text = artist.artistName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];

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
    if ([segue.identifier isEqualToString:@"ViewArtistShowSegue"]) {
        ArtistDetailViewController *detailVC = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        detailVC.artist = self.artistController.favoriteArtists[indexPath.row];
        detailVC.artistController = self.artistController;
    } else if ([segue.identifier isEqualToString:@"AddArtistShowSegue"]) {
        ArtistDetailViewController *detailVC = [segue destinationViewController];
        detailVC.artistController = self.artistController;
    }
}

@end
