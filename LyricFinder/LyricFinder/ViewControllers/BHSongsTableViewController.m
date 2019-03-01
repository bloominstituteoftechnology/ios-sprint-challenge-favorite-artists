//
//  SongsTableViewController.m
//  LyricFinder
//
//  Created by Benjamin Hakes on 3/1/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import "BHSongsTableViewController.h"
#import "BHSearchNetworkController.h"
#import "BHSongTableViewCell.h"
#import "BHSongDetailViewController.h"

@interface BHSongsTableViewController ()

@property BHSearchNetworkController *searchController;

@end

@implementation BHSongsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.allowsMultipleSelectionDuringEditing = NO;
    _searchController = [[BHSearchNetworkController alloc] init];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _searchController.songs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BHSongTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"SongCell" forIndexPath:indexPath];
    BHSong *song = [_searchController.songs objectAtIndex: indexPath.row];
    
    cell.textLabel.text = [song title];
    
    cell.detailTextLabel.text = [song artist];
    // Configure the cell...
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES - we will be able to delete all rows
    return YES;
}
// Override to support editing the table view.

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
        // Delete the row from the data source
        [_searchController.songs removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    BHSongDetailViewController *destVC = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    if([segue.identifier  isEqual: @"AddNewSongSegue"]){
        // do something
        destVC.searchController = _searchController;
        [destVC setIsUpdatingView: NO];
        BHSong *newSong = [[BHSong alloc] init];
        destVC.song = newSong;
        
    } else if ([segue.identifier  isEqual: @"ViewExistingSongSegue"]){
        // do something else
        destVC.searchController = _searchController;
        destVC.isUpdatingView = @YES;
        destVC.song = [_searchController.songs objectAtIndex:indexPath.row];
        
    } else {
        // do something else
    }
    
}


- (IBAction)addNewSongButtonClicked:(id)sender {
}
@end
