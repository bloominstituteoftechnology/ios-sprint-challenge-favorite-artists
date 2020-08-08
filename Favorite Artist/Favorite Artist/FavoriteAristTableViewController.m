//
//  FavoriteAristTableViewController.m
//  Favorite Artist
//
//  Created by Gerardo Hernandez on 8/8/20.
//  Copyright © 2020 Gerardo Hernandez. All rights reserved.
//

#import "FavoriteAristTableViewController.h"
#import "Artist.h"
#import "FavoriteArtistController.h"
#import "ArtistDetailViewController.h"


@interface FavoriteAristTableViewController ()

@property FavoriteArtistController *favoriteArtistController;

@end

@implementation FavoriteAristTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.favoriteArtistController = [[FavoriteArtistController alloc] init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.favoriteArtistController.artist.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];

    Artist *artist = [self.favoriteArtistController.artist objectAtIndex:indexPath.row];
    cell.textLabel.text = artist.name;
    
    if (artist.yearFormed != 0) {
        NSString *yearFormedString = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];
        cell.detailTextLabel.text = yearFormedString;
    } else {
        cell.detailTextLabel.text = nil;
    }
    return cell;
}
    
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
         Artist *artist = [self.favoriteArtistController.artist objectAtIndex:indexPath.row];
               [self.favoriteArtistController deleteArtist:artist];
               [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
}


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ArtistDetailShowSegue"]) {
        ArtistDetailViewController *artistDetailVC = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Artist *artist = [self.favoriteArtistController.artist objectAtIndex:indexPath.row];
        
        artistDetailVC.artist = artist;
        artistDetailVC.isShowingFavoriteArtist = YES;
        
    } else if ([[segue identifier] isEqualToString:@"ArtistDetailShowSegue"]) {
        ArtistDetailViewController *artistDetailVC = [segue destinationViewController];
        
        artistDetailVC.isShowingFavoriteArtist = NO;
        artistDetailVC.favoriteArtistController = self.favoriteArtistController;
    }
}


@end
