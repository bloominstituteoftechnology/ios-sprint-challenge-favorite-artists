//
//  FavoriteArtistsTableViewController.m
//  Favorite Artists
//
//  Created by David Wright on 5/31/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

#import "FavoriteArtistsTableViewController.h"
#import "Artist.h"
#import "FavoriteArtistsController.h"
#import "ArtistDetailViewController.h"

@interface FavoriteArtistsTableViewController ()

@property FavoriteArtistsController *favoriteArtistsController;

@end

@implementation FavoriteArtistsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.favoriteArtistsController = [[FavoriteArtistsController alloc] init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.favoriteArtistsController.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FavoriteArtistCell" forIndexPath:indexPath];
    
    Artist *artist = [self.favoriteArtistsController.artists objectAtIndex:indexPath.row];
    cell.textLabel.text = artist.name;
    
    if (artist.yearFormed != 0) {
        NSString *yearFormedString = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];
        cell.detailTextLabel.text = yearFormedString;
    } else {
        cell.detailTextLabel.text = nil;
    }
    
    return cell;
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowArtistDetailSegue"]) {
            ArtistDetailViewController *artistDetailVC = [segue destinationViewController];
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            Artist *artist = [self.favoriteArtistsController.artists objectAtIndex:indexPath.row];
            
            artistDetailVC.artist = artist;
            artistDetailVC.isShowingFavoriteArtistDetail = YES;
            
        } else if ([[segue identifier] isEqualToString:@"ShowAddArtistSegue"]) {
            ArtistDetailViewController *artistDetailVC = [segue destinationViewController];
            
            artistDetailVC.isShowingFavoriteArtistDetail = NO;
            artistDetailVC.favoriteArtistsController = self.favoriteArtistsController;
        }
}

@end
