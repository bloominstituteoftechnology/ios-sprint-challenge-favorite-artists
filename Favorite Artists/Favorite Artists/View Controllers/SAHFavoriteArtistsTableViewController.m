//
//  SAHFavoriteArtistsTableViewController.m
//  Favorite Artists
//
//  Created by scott harris on 4/17/20.
//  Copyright © 2020 scott harris. All rights reserved.
//

#import "SAHFavoriteArtistsTableViewController.h"
#import "SAHArtistController.h"
#import "SAHArtist.h"
#import "SAHArtistDetailViewController.h"

@interface SAHFavoriteArtistsTableViewController () <UITableViewDataSource>

@property (nonatomic) SAHArtistController *artistController;

@end

@implementation SAHFavoriteArtistsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Favorite Artists";
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.artistController = [[SAHArtistController alloc] init];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistController.favoriteArtists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    SAHArtist *artist = self.artistController.favoriteArtists[indexPath.row];
    
    // Configure the cell...
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];
    
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    SAHArtist *artist = self.artistController.favoriteArtists[indexPath.row];
//    [self performSegueWithIdentifier:@"ArtistDetailShowSegue" sender:self];
//}


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
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"ArtistDetailShowSegue"]) {
        SAHArtistDetailViewController *detailVC = [segue destinationViewController];
        detailVC.artistController = self.artistController;
    } else if ([segue.identifier isEqualToString:@"ShowArtistDetailSegue"]) {
        SAHArtistDetailViewController *detailVC = [segue destinationViewController];
        
        NSIndexPath *selectedIndex = [self.tableView indexPathForSelectedRow];
        if (selectedIndex) {
            SAHArtist *artist = self.artistController.favoriteArtists[selectedIndex.row];
            detailVC.artist = artist;
        }
        
        
    }
}

@end
