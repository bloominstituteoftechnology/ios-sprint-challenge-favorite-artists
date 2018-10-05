//
//  SMFSongsTableViewController.m
//  Lyric Finder
//
//  Created by Samantha Gatt on 10/5/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "SMFSongsTableViewController.h"
#import "SMFSongController.h"
#import "SMFSong+CoreDataClass.h"
#import "SMFSongDetailViewController.h"

#pragma mark Extension
@interface SMFSongsTableViewController ()

@property SMFSongController *songController;
@property NSFetchedResultsController *frc;

@end

#pragma mark - Implementation
@implementation SMFSongsTableViewController

#pragma mark - Initializers
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _frc = [self createFRC];
        NSError *error;
        __unused BOOL success = [_frc performFetch:&error];
        _frc.delegate = self;
    }
    return self;
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _frc = [self createFRC];
        NSError *error;
        __unused BOOL success = [_frc performFetch:&error];
        _frc.delegate = self;
    }
    return self;
}

#pragma mark - Functions
- (NSFetchedResultsController *)createFRC {
    NSManagedObjectContext *context = self.songController.moc;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"SMFSong"];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    return [[NSFetchedResultsController alloc]
            initWithFetchRequest:fetchRequest
            managedObjectContext:context
            sectionNameKeyPath:nil
            cacheName:nil];
    
    
}

#pragma mark - NSFetchedResultsControllerDelgate
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}
- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeMove:
            break;
        case NSFetchedResultsChangeUpdate:
            break;
    }
}
- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeUpdate:
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:5];
            break;
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.frc.fetchedObjects.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SongCell" forIndexPath:indexPath];
    
    SMFSong *song = [self.frc objectAtIndexPath:indexPath];
    cell.textLabel.text = song.title;
    cell.detailTextLabel.text = song.artist;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        SMFSong *song = [self.frc objectAtIndexPath:indexPath];
        [self.songController deleteSong:song];
    }
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SMFSongDetailViewController *destinationVC = segue.destinationViewController;
    destinationVC.songController = self.songController;
    
    if ([segue.identifier  isEqualToString: @"ShowSongDetail"]) {
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        destinationVC.song = [self.frc objectAtIndexPath:indexPath];
    }
}

@end
