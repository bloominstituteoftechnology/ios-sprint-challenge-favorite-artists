//
//  ArtistTableViewController.m
//  FavoriteArtists
//
//  Created by Joel Groomer on 2/8/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

#import "ArtistTableViewController.h"
#import "Artist.h"
#import "ArtistController.h"
#import "ArtistDetailViewController.h"

@interface ArtistTableViewController ()

@property ArtistController *artistController;

@end

@implementation ArtistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.artistController = [[ArtistController alloc] init];
}

- (void)viewWillAppear:(BOOL)animated
{
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];

    Artist *artist = self.artistController.artists[indexPath.row];
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:(@"Formed in %d"), artist.yearFormed ];
    
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    ArtistDetailViewController *vc = segue.destinationViewController;
    vc.artistController = self.artistController;
    
    if ([segue.identifier isEqualToString:(@"ShowArtistDetail")]) {
        vc.artist = self.artistController.artists[self.tableView.indexPathForSelectedRow.row];
    }
}

@end
