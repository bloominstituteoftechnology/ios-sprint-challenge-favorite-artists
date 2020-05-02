//
//  CCCArtistTableViewController.m
//  ChallengeRewrite
//
//  Created by Ryan Murphy on 7/19/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

#import "CCCArtistTableViewController.h"
#import "CCCArtist.h"
#import "CCCArtistDetailViewController.h"

@interface CCCArtistTableViewController ()

- (NSMutableArray *)fetchFromPersistence;

@end


@implementation CCCArtistTableViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.artists = [self fetchFromPersistence];
    [[self tableView] reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.artists) {
        return self.artists.count;
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    CCCArtist *artist = [self artists][indexPath.row];
    
    cell.textLabel.text = artist.name;
    
    NSNumber *year = [[NSNumber alloc] initWithInt:artist.yearFormed];
    
    cell.detailTextLabel.text = [year stringValue];
    
    return cell;
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        // Delete the row from the data source
//
//        // Get the task and remove it
//       CCCArtist *artist = self.artist[indexPath.row];
//        [self.tasksController removeTask:artist];
//
//        // TODO: Why do all animations look the same???
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    }
//}

- (NSMutableArray *)fetchFromPersistence {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *docsDirectory =  [fileManager URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
    NSURL *path = [[docsDirectory URLByAppendingPathComponent:@"artists"] URLByAppendingPathExtension:@"json"];
    
    NSData *artistsData = [[NSData alloc] initWithContentsOfURL:path];
    
    if (artistsData) {
        NSDictionary *artistDictionaries = [NSJSONSerialization JSONObjectWithData:artistsData options:0 error:nil];
        
        NSDictionary *artistsDict = artistDictionaries[@"artists"];
        
        NSMutableArray *artists = [[[NSMutableArray alloc] init] mutableCopy];
        
        for (NSDictionary *artistDict in artistsDict) {
            NSArray *array = [[NSArray alloc] initWithObjects:artistDict, nil];
            NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:array, @"artists", nil];
            
            CCCArtist *artist = [[CCCArtist alloc] initWithDictionary:dict];
            [artists addObject:artist];
        }
        
        return artists;
    } else {
        return [[NSMutableArray alloc] init];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"AddSegue"]) {
        CCCArtistDetailViewController *detailViewController = [segue destinationViewController];
        if (self.artists) {
            detailViewController.artists = self.artists;
        } else {
            detailViewController.artists = NULL;
        }
    }
    
    if ([[segue identifier] isEqualToString:@"ShowSegue"]) {
        CCCArtistDetailViewController *detailViewController = [segue destinationViewController];
        NSIndexPath *index = [[self tableView] indexPathForSelectedRow];
        CCCArtist *artist = [self artists][index.row];
        detailViewController.artist = artist;
        detailViewController.artists = [self artists];
    }
}

@end
