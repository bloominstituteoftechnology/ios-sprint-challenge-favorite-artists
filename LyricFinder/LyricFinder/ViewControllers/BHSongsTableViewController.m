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
#import "BHSongController.h"
#import "CoreData/CoreData.h"

@interface BHSongsTableViewController ()

@property BHSearchNetworkController *searchController;
@property BHSongController *songController;
@property NSFetchedResultsController *frc;

@end

@implementation BHSongsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.allowsMultipleSelectionDuringEditing = NO;
    _frc.delegate = self;
    _searchController = [[BHSearchNetworkController alloc] init];
    _songController = [[BHSongController alloc] init];
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
    return _songController.songs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BHSongTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"SongCell" forIndexPath:indexPath];
    BHSong *song = [_songController.songs objectAtIndex: indexPath.row];
    
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
        [_songController.songs removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
}

#pragma mark - NSFetchedResultsControllerDelegateMethods

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates]; // self.tableView.beginUpdates
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates]; // self.tableView.endUpdates
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    switch (type){
        case NSFetchedResultsChangeInsert:
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteRowsAtIndexPaths: @[indexPath] withRowAnimation: UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeMove:
            [self.tableView moveRowAtIndexPath: indexPath toIndexPath: newIndexPath];
            break;
        case NSFetchedResultsChangeUpdate:
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation: UITableViewRowAnimationAutomatic];
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
            
        case NSFetchedResultsChangeMove:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
            
            break;
        case NSFetchedResultsChangeDelete:
        case NSFetchedResultsChangeUpdate:
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        
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
        destVC.songController = _songController;
        [destVC setIsUpdatingView: NO];
        BHSong *newSong = [[BHSong alloc] init];
        destVC.song = newSong;
        
    } else if ([segue.identifier  isEqual: @"ViewExistingSongSegue"]){
        // do something else
        destVC.songController = _songController;
        destVC.isUpdatingView = @YES;
        destVC.song = [_songController.songs objectAtIndex:indexPath.row];
        
    }
    
}

@end
