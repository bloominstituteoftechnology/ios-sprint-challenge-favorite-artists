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
    
//    if ( _lyricFinderController.savedSongs == nil ){
//        _lyricFinderController.savedSongs = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"SavedSongs"] mutableCopy];
//    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
}

#pragma mark - Table view data source

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



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        JKSong *song = [self.lyricFinderController.savedSongs objectAtIndex:indexPath.row];
        [self.lyricFinderController removeSavedSong:song];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


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

    if ([segue.identifier isEqual:@"ShowSongDetail"]) {
        JKSongDetailViewController *destinationVC = [segue destinationViewController];
        NSIndexPath *selectedRow = self.tableView.indexPathForSelectedRow;
        NSInteger row = selectedRow.row;
        JKSong *song = [self.lyricFinderController.savedSongs objectAtIndex:row];
        
        destinationVC.song = song;
        destinationVC.lyricFinderController = self.lyricFinderController;
        
    }else if ([segue.identifier isEqual:@"ShowAddNewSongLyrics"]) {
        JKSongDetailViewController *destinationVC = [segue destinationViewController];
        
        destinationVC.lyricFinderController = self.lyricFinderController;
        
    }
}


@end
