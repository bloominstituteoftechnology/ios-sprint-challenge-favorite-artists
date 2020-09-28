//
//  MJSArtistTableViewController.m
//  FavoriteArtists
//
//  Created by Morgan Smith on 9/27/20.
//

#import "MJSArtistTableViewController.h"
#import "MJSArtist.h"
#import "MJSArtistController.h"
#import "MJSArtistDetailViewController.h"

@interface MJSArtistTableViewController ()

@property (nonatomic) MJSArtistController *artistController;
@property (nonatomic) NSMutableArray *savedArtist;

@end

@implementation MJSArtistTableViewController

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

    MJSArtist *artist = self.savedArtist[indexPath.row];

    if (artist.yearFormed == 0) {
        cell.detailTextLabel.text = @"N/A";
        cell.textLabel.text = artist.artist;
    } else {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];
        cell.textLabel.text = artist.artist;
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
    if ([segue.identifier isEqualToString:@"AddArtist"]) {
        MJSArtistDetailViewController *controller = (MJSArtistDetailViewController *)segue.destinationViewController;
        controller.artistController = self.artistController;

    }

    if ([segue.identifier isEqualToString:@"ShowArtist"]) {
        MJSArtistDetailViewController *controller = (MJSArtistDetailViewController *)segue.destinationViewController;
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        controller.artist = self.savedArtist[selectedIndexPath.row];
    }
}

    - (MJSArtistController *)artistController {
        if (!_artistController) {
            _artistController = [[MJSArtistController alloc] init];
        }

        return _artistController;
    }


@end
