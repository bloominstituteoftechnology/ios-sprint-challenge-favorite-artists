//
//  JKSongTableViewController.m
//  LyricFinder
//
//  Created by TuneUp Shop  on 3/1/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import "JKSongTableViewController.h"


@interface JKSongTableViewController ()

@property (nonatomic, readonly) JKLyricFinderController *lyricFinderController;

@end

@implementation JKSongTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _lyricFinderController = [[JKLyricFinderController alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lyricFinderController.savedSongs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SongCell" forIndexPath:indexPath];
    
    // Configure the cell...
    JKSong *song = [self.lyricFinderController.savedSongs objectAtIndex:indexPath.row];
    cell.textLabel.text = song.songTitle;
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


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqual:@"ShowSongDetail"]) {
        JKSongDetailViewController *destinationVC = segue.destinationViewController;
        NSIndexPath *selectedRow = self.tableView.indexPathForSelectedRow;
        NSInteger row = selectedRow.row;
        JKSong *song = [self.lyricFinderController.savedSongs objectAtIndex:row];
        destinationVC.song = song;
        destinationVC.lyricFinderController = self.lyricFinderController;
    }else if ([segue.identifier isEqual:@"ShowAddNewSongLyrics"]) {
        JKSongDetailViewController *destinationVC = segue.destinationViewController;
        
        destinationVC.lyricFinderController = self.lyricFinderController;
    }
}


@end
