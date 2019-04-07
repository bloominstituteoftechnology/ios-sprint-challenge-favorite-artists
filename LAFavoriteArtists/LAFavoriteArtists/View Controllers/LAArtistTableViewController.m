//
//  LAArtistTableViewController.m
//  LAFavoriteArtists
//
//  Created by Angel Buenrostro on 4/5/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

#import "LAArtistTableViewController.h"
#import "LAArtistController.h"
#import "LADetailViewController.h"

@interface LAArtistTableViewController ()
@property LAArtistController *artistController;
@property NSMutableArray *artistArray;
@property LAArtist *artistForSegue;
@end

@implementation LAArtistTableViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:true];
    // Initialize artistController
    if(!self.artistController){
        self.artistController = [[LAArtistController alloc]init];
        self.artistForSegue = [[LAArtist alloc]init];
    }
    // Clear array so no duplicates will be added to our tableView then fetch all saved artists and reload table
    [_artistArray removeAllObjects];
    self.artistArray = [self.artistController fetchAllSavedArtists];
    self.tableView.reloadData;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _artistArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    // Configure the cell...
    LAArtist *artist = _artistArray[indexPath.row];
    cell.textLabel.text = artist.name;
    NSString *yearString = [NSString stringWithFormat:@"%d",artist.year];
    cell.detailTextLabel.text = yearString;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.artistForSegue = [_artistArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"showDetail" sender:self.artistForSegue];
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
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier  isEqual: @"showDetail"]){
    LADetailViewController *detailVC = segue.destinationViewController;
    detailVC.artist = sender;
    }
}


@end
