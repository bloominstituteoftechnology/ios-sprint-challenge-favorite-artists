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

@end

@implementation NYCArtistsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *docsDirectory =  [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    NSURL *path = [docsDirectory URLByAppendingPathComponent:@"artists.plist"];
    self.artists = [NSKeyedUnarchiver unarchiveObjectWithFile:path.absoluteString];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    NYCArtist *artist = [self artists][indexPath.row];
    
    cell.textLabel.text = artist.name;
    
    NSNumber *year = [[NSNumber alloc] initWithInt:artist.yearFormed];
    
    cell.detailTextLabel.text = [year stringValue];
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"Add"]) {
        NYCArtistDetailViewController *detailVC = [segue destinationViewController];
        detailVC.artists = [self artists];
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
