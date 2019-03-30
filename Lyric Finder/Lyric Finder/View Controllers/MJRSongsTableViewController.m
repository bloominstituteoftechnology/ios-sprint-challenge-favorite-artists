//
//  MJRSongsTableViewController.m
//  Lyric Finder
//
//  Created by Moses Robinson on 3/29/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

#import "MJRSongsTableViewController.h"
#import "MJRSongController.h"
#import "MJRSong.h"
#import "MJRSongDetailViewController.h"

@interface MJRSongsTableViewController ()

@end

@implementation MJRSongsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.songController songs] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SongCell" forIndexPath:indexPath];
    
    MJRSong *song = self.songController.songs[indexPath.row];
    
    cell.textLabel.text = song.title;
    cell.detailTextLabel.text = song.artist;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"ShowDetail"]) {
        
        // Passing the task and task controller (tapped on a task cell)
        
        MJRSongDetailViewController *destination = segue.destinationViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        
        destination.songController = self.songController;
        destination.song = self.songController.songs[indexPath.row];
    } else if ([segue.identifier isEqualToString:@"ShowCreate"]) {
        
        MJRSongDetailViewController *destination = segue.destinationViewController;
        
        destination.songController = self.songController;
    }
}

// MARK: - Properties

@synthesize songController = _songController;

- (MJRSongController *)documentController
{
    if (!_songController) {
        _songController = [[MJRSongController alloc] init];
    }
    return _songController;
}

@end
