//
//  YZISongsTableViewController.m
//  Lyrics-Finder
//
//  Created by Yvette Zhukovsky on 1/25/19.
//  Copyright © 2019 Yvette Zhukovsky. All rights reserved.
//

#import "YZISongsTableViewController.h"
#import "YZISongs.h"
#import "YZISongsController.h"
#import "YZISongsDetailViewController.h"

@interface YZISongsTableViewController ()

@property (nonatomic) YZISongsController *lyricsController ;

@end

@implementation YZISongsTableViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _lyricsController = [[YZISongsController alloc] init];
   
}



#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.lyricsController.songs.count ;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    YZISongs *song = self.lyricsController.songs[indexPath.row];
    
    cell.textLabel.text = song.title;
    cell.detailTextLabel.text = song.artistName;
    
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




// In a storyboard-based application, you will often want to do a little preparation before navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"cellShow"]) {
        YZISongsDetailViewController *destVC = segue.destinationViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        YZISongs *song = self.lyricsController.songs[indexPath.row];
        
        destVC.songs = song;
    } else if ([segue.identifier isEqualToString:@"addSong"]) {
        YZISongsDetailViewController *destVC = segue.destinationViewController;
        
        destVC.songController = self.lyricsController;
    }
}


@end
