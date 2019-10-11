//
//  ArtistTableViewController.m
//  Favorite Artists ObjC
//
//  Created by Michael Redig on 10/11/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

#import "REPArtistTableViewController.h"
#import "REPCoreDataStack.h"
#import "REPArtist+CoreDataClass.h"

@interface REPArtistTableViewController ()

@property (nonatomic) NSFetchedResultsController *fetchedResultsController;

@end

@implementation REPArtistTableViewController

- (NSFetchedResultsController *)fetchedResultsController {
	if (_fetchedResultsController == nil) {
		NSFetchRequest* fetchRequest = [REPArtist fetchRequest];
		fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:true]];

		NSManagedObjectContext* moc = [REPCoreDataStack sharedInstance].mainContext;

		_fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
																		managedObjectContext:moc
																		  sectionNameKeyPath:nil
																				   cacheName:nil];

		_fetchedResultsController.delegate = self;

		NSError* error;
		[_fetchedResultsController performFetch:&error];
		if (error) {
			NSLog(@"error performing initial fetch for frc: %@", error);
			exit(1);
		}
	}
	return _fetchedResultsController;
}

- (void)viewDidLoad {
    [super viewDidLoad];


}

// MARK: - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.fetchedResultsController.sections[section].numberOfObjects;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
	REPArtist *artist = [self.fetchedResultsController objectAtIndexPath:indexPath];
	cell.textLabel.text = artist.name;
	cell.detailTextLabel.text = [NSString stringWithFormat:@"Year formed: %i", artist.yearFormed];
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	NSLog(@"navigating to %@", segue.identifier);
}


- (IBAction)addButton:(UIBarButtonItem *)sender {
}



// MARK: - Fetched Results Controller Delegate
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
	[self.tableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
	[self.tableView endUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
	NSIndexSet* indexSet = [NSIndexSet indexSetWithIndex:sectionIndex];
	switch (type) {
		case NSFetchedResultsChangeInsert:
			[self.tableView insertSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
			break;

		case NSFetchedResultsChangeDelete:
			[self.tableView deleteSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
			break;

		default:
			NSLog(@"unexpected NSFetchedResultsChangeType");
			break;
	}
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
	switch (type) {
		case NSFetchedResultsChangeInsert:
			[self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
			break;
		case NSFetchedResultsChangeMove:
			[self.tableView moveRowAtIndexPath:indexPath toIndexPath:newIndexPath];
			break;
		case NSFetchedResultsChangeUpdate:
			[self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
			break;
		case NSFetchedResultsChangeDelete:
			[self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
			break;
		default:
			NSLog(@"unexpected NSFetchedResultsChangeType");
			break;
	}
}

- (NSString *)controller:(NSFetchedResultsController *)controller sectionIndexTitleForSectionName:(NSString *)sectionName {
	return nil;
}

@end
