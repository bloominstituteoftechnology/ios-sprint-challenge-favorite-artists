//
//  ArtistsTableViewController.m
//  FavoriteArtists
//
//  Created by Bobby Keffury on 2/7/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

#import "ArtistsTableViewController.h"
#import "ArtistController.h"
#import "Artist.h"
#import "ArtistDetailViewController.h"

@interface ArtistsTableViewController ()

@property (nonatomic, readonly) ArtistController *artistController;

@end

@implementation ArtistsTableViewController


//MARK: - Views

- (void)viewDidLoad {
    [super viewDidLoad];
}

//MARK: - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _artistController.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    Artist *artist = [self.artistController.artists objectAtIndex:indexPath.row];
    
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = artist.founded;
    
    return cell;
}

//MARK: - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@""]) {
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        ArtistDetailViewController *detailVC = segue.destinationViewController;
        detailVC.artistController = self.artistController;
        detailVC.artist = [self.artistController.artists objectAtIndex:indexPath.row];
    } else if ([segue.identifier isEqualToString:@""]) {
        ArtistDetailViewController *detailVC = segue.destinationViewController;
        detailVC.artistController = self.artistController;
    }
}

@end
