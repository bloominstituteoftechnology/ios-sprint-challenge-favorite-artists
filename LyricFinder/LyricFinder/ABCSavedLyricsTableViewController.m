//
//  ABCLyricsTableViewController.m
//  LyricFinder
//
//  Created by Austin Cole on 3/1/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import "ABCSavedLyricsTableViewController.h"
#import "ABCSongController.h"
#import "ABCLyricsSearchViewController.h"
#import "Song+NSJSONSerialization.h"

@interface ABCSavedLyricsTableViewController ()

@property ABCSongController *songController;
@property NSInteger count;
@property Song *song;

@end

@implementation ABCSavedLyricsTableViewController : UITableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _songController = [[ABCSongController alloc] init];
    _count = 0;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
    _count += 1;
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_songController.savedSongsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SongCell" forIndexPath:indexPath];
    
    
    //FIXME: This is a bad band-aid fix.
    if ([_songController.savedSongsArray objectAtIndex:indexPath.row] == [_songController.savedSongsArray objectAtIndex: _songController.savedSongsArray.count - 1] && _count > 1) {
        NSDictionary *songDictionary = _songController.savedSongsArray.lastObject;
        _song = [_song initWithDictionary:songDictionary];
    } else {
        _song = [_songController.savedSongsArray objectAtIndex:indexPath.row];
    }
    
    
    
    
    
    cell.textLabel.text = _song.title;
    NSInteger rating = _song.rating;
    NSString *ratingString = [[NSString alloc] initWithFormat:@"%lu", rating];
    cell.detailTextLabel.text = ratingString;
    
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
    ABCLyricsSearchViewController *destination = segue.destinationViewController;
    destination.songController = [[ABCSongController alloc] init];
    destination.songController = [self songController];
}

@end
