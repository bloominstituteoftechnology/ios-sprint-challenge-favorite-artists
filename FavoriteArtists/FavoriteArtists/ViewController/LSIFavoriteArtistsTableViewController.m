//
//  LSIFavoriteArtistsTableViewController.m
//  FavoriteArtists
//
//  Created by Elizabeth Thomas on 9/27/20.
//

#import "LSIFavoriteArtistsTableViewController.h"
#import "LSIArtist.h"
#import "LSIArtistDetailViewController.h"
#import "LSIArtistController.h"

@interface LSIFavoriteArtistsTableViewController ()

@property LSIArtistController *artistController;

@end

@implementation LSIFavoriteArtistsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.artistController = [[LSIArtistController alloc] init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistController.artists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    LSIArtist *artist = [self.artistController.artists objectAtIndex:indexPath.row];
    cell.textLabel.text = artist.name;

    if (artist.yearFormed != 0) {
        NSString *yearFormedString = [NSString localizedStringWithFormat:@"Formed in %d", artist.yearFormed];
        cell.detailTextLabel.text = yearFormedString;
    } else {
        cell.detailTextLabel.text = nil;
    }
    
    return cell;
}


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

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ArtistDetailSegue"]) {
        LSIArtistDetailViewController *detailVC = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        LSIArtist *artist = [self.artistController.artists objectAtIndex:indexPath.row];

        detailVC.artist = artist;
        detailVC.isShowingArtistDetail = YES;

    } else if ([segue.identifier isEqualToString:@"AddArtistSegue"]) {
        LSIArtistDetailViewController *detailVC = [segue destinationViewController];

        detailVC.isShowingArtistDetail = NO;
        detailVC.artistController = self.artistController;
    }
}


@end
