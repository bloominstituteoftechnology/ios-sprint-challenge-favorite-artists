//
//  MKJFavoriteArtistsTableViewController.m
//  FavoriteArtists
//
//  Created by Kenneth Jones on 12/3/20.
//

#import "MKJFavoriteArtistsTableViewController.h"
#import "MKJArtistFetcher.h"
#import "MKJAddArtistViewController.h"
#import "MKJViewArtistViewController.h"

@interface MKJFavoriteArtistsTableViewController ()

@property (nonatomic) MKJArtistFetcher *fetcher;

@end

@implementation MKJFavoriteArtistsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fetcher = [[MKJArtistFetcher alloc] init];
    
    [self.tableView reloadData];
    
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
    return _fetcher.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    MKJArtist *artist = _fetcher.artists[indexPath.row];
    cell.textLabel.text = artist.artist;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %i", artist.year];
    
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
    if ([segue.identifier isEqualToString:@"AddArtistSegue"]) {
        MKJAddArtistViewController *detailVC = [segue destinationViewController];
        detailVC.fetcher = _fetcher;
    } else if ([segue.identifier isEqualToString:@"ViewArtistSegue"]) {
        MKJViewArtistViewController *detailVC = [segue destinationViewController];
        detailVC.fetcher = _fetcher;
        detailVC.artist = _fetcher.artists[[self.tableView indexPathForSelectedRow].row];
    }
}

@end
