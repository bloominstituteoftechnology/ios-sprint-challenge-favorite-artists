//
//  CARFavoriteArtistsTableViewController.m
//  FavoriteArtists
//
//  Created by Chad Rutherford on 2/21/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import "CARFavoriteArtistsTableViewController.h"
#import "CARArtist+CoreDataClass.h"
#import "CARArtist+CoreDataProperties.h"
#import "CARCoreDataStack.h"
//#import "CARArtistDetailViewController"

@interface CARFavoriteArtistsTableViewController ()

@property NSFetchedResultsController *fetchedResultsController;
@property CARCoreDataStack *stack;
@property CARArtist *artist;

@end

@implementation CARFavoriteArtistsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.stack = [[CARCoreDataStack alloc] init];
    NSFetchRequest *fetchRequest = [CARArtist fetchRequest];
    fetchRequest.sortDescriptors = @[
        [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]
    ];
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.stack.viewContext sectionNameKeyPath:nil cacheName:nil];
    self.fetchedResultsController.delegate = self;
    NSError *fetchError = nil;
    [self.fetchedResultsController performFetch:&fetchError];
    if (fetchError) {
        NSLog(@"Error fetching objects: %@", fetchError);
        return;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSError *fetchError = nil;
    [self.fetchedResultsController performFetch:&fetchError];
    if (fetchError) {
        NSLog(@"Error fetching objects: %@", fetchError);
        return;
    }
    [self.tableView reloadData];
}

- (IBAction)addButtonTapped:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"ShowAddArtistSegue" sender:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.fetchedResultsController.fetchedObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    CARArtist *artist = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = artist.name;
    if (artist.yearFormed == 0) {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %@", @"N/A"];
    } else {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];
    }
    return cell;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        CARArtist *artist = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [self.stack.viewContext deleteObject:artist];
        NSError *deleteError = nil;
        [self.stack.viewContext save:&deleteError];
        if (deleteError) {
            NSLog(@"Error deleting objects: %@", deleteError);
            return;
        }
    }
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        default:
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeUpdate:
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeMove:
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        default:
            break;
    }
}

@end
