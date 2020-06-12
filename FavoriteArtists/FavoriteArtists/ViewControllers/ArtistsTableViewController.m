//
//  ArtistsTableViewController.m
//  FavoriteArtists
//
//  Created by Bhawnish Kumar on 6/12/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

#import "ArtistsTableViewController.h"
#import "LSIArtist.h"
#import "LSIArtistController.h"
#import "SearchArtistViewController.h"

@interface ArtistsTableViewController ()

@property (nonatomic) LSIArtistController *artistController;
@property (nonatomic) NSMutableArray *savedArtist;

@end

@implementation ArtistsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *newArtists = [self.artistController fetchSavedArtist];
    self.savedArtist = [[NSMutableArray alloc] initWithArray:newArtists];
}

-(void)viewWillAppear:(BOOL)animated{
   [super viewWillAppear:animated];
    
    NSArray *newArtists = [self.artistController fetchSavedArtist];
    self.savedArtist = [[NSMutableArray alloc] initWithArray:newArtists];
    
    [self.tableView reloadData];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.savedArtist.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    LSIArtist *artist = self.savedArtist[indexPath.row];
    cell.textLabel.text = artist.artist;
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
    
       if([segue.identifier isEqualToString:@"searchArtistSegue"]){
        SearchArtistViewController *controller = (SearchArtistViewController *)segue.destinationViewController;
        controller.artistController = self.artistController;
    }
    
    if ([segue.identifier isEqualToString:@"artistDetailSegue"]) {
       SearchArtistViewController *controller = (SearchArtistViewController *)segue.destinationViewController;
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        controller.artist = self.savedArtist[selectedIndexPath.row];
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (LSIArtistController *)artistController {
    if (!_artistController) {
        _artistController = [[LSIArtistController alloc] init];
    }
    return _artistController;
}



@end
