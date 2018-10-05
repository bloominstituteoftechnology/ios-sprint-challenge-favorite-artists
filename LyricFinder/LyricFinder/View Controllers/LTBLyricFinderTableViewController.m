//
//  LTBLyricFinderTableViewController.m
//  LyricFinder
//
//  Created by Linh Bouniol on 10/5/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

#import "LTBLyricFinderTableViewController.h"
#import "LTBLyricController.h"
#import "LTBLyric+Convenience.h"
#import "LTBCoreDataStack.h"
#import "LTBLyricsViewController.h"

@interface LTBLyricFinderTableViewController ()

@property (nonatomic, readonly) NSFetchedResultsController *fetchedResultsCotntroller;

@end

@implementation LTBLyricFinderTableViewController

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _lyricController = [[LTBLyricController alloc] init];
    }
    return self;
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _lyricController = [[LTBLyricController alloc] init];
    }
    return self;
}

@synthesize fetchedResultsCotntroller = _fetchedResultsCotntroller;

- (NSFetchedResultsController *)fetchedResultsCotntroller // the property is a readonly (setter doesn't exist), and we need an instance variable for this getter
{
    if (!_fetchedResultsCotntroller) { // lazy
        // if _fetchedResultsCotntroller doesn't exist yet, let's make one
        NSFetchRequest *fetchRequest = LTBLyric.fetchRequest;
        fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES]];
        
        NSManagedObjectContext *moc = LTBCoreDataStack.sharedStack.mainContext;
        
        _fetchedResultsCotntroller = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:moc sectionNameKeyPath:nil cacheName:nil];
        _fetchedResultsCotntroller.delegate = self;
        [_fetchedResultsCotntroller performFetch:NULL]; // don't care about error, return NULL
    }
    return _fetchedResultsCotntroller; // if _fetchedResultsCotntroller exists, return it as is
}

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
        default:
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
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
            [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.fetchedResultsCotntroller.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.fetchedResultsCotntroller.sections[section].numberOfObjects;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LyricCell" forIndexPath:indexPath];
    
    LTBLyric *lyrics = [self.fetchedResultsCotntroller objectAtIndexPath:indexPath];
    
    cell.textLabel.text = lyrics.title;
    cell.detailTextLabel.text = lyrics.artist;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // cast
    LTBLyricsViewController *detailVC = [segue destinationViewController];
    
    // checking the cast
    if ([detailVC isKindOfClass:[LTBLyricsViewController class]]) {
        detailVC.lyricController = self.lyricController;
        
        if ([segue.identifier isEqualToString:@"ShowDetail"]) {
            NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
            
            detailVC.lyrics = [self.fetchedResultsCotntroller objectAtIndexPath:indexPath];
        }
    }
}

@end
