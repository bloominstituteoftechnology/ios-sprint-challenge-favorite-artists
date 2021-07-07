//
//  NYCArtistsTableViewController.m
//  FavArtists
//
//  Created by Nathanael Youngren on 4/5/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

#import "NYCArtistsTableViewController.h"
#import "NYCArtist.h"
#import "NYCArtistDetailViewController.h"

@interface NYCArtistsTableViewController ()

- (NSMutableArray *)fetchFromPersistence;

@end

@implementation NYCArtistsTableViewController

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
    
    NYCArtist *artist = [self artists][indexPath.row];
    
    cell.textLabel.text = artist.name;
    
    NSNumber *year = [[NSNumber alloc] initWithInt:artist.yearFormed];
    
    cell.detailTextLabel.text = [year stringValue];
    
    return cell;
}

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
            NSArray *fauxArray = [[NSArray alloc] initWithObjects:artistDict, nil];
            NSDictionary *fauxDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:fauxArray, @"artists", nil];
            
            NYCArtist *artist = [[NYCArtist alloc] initWithDictionary:fauxDictionary];
            [artists addObject:artist];
        }
        
        return artists;
    } else {
        return [[NSMutableArray alloc] init];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"Add"]) {
        NYCArtistDetailViewController *detailVC = [segue destinationViewController];
        if (self.artists) {
            detailVC.artists = self.artists;
        } else {
            detailVC.artists = NULL;
        }
    }
    
    if ([[segue identifier] isEqualToString:@"Show"]) {
        NYCArtistDetailViewController *detailVC = [segue destinationViewController];
        NSIndexPath *index = [[self tableView] indexPathForSelectedRow];
        NYCArtist *artist = [self artists][index.row];
        detailVC.artist = artist;
        detailVC.artists = [self artists];
    }
}

@end
