//
//  ArtistsTableViewController.m
//  FavoriteArtists
//
//  Created by Claudia Maciel on 7/31/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

#import "ArtistsTableViewController.h"
#import "Artist.h"
#import "ArtistDetailViewController.h"
#import "ArtistsController.h"

@interface ArtistsTableViewController ()

@property ArtistsController *artistController;

@end

@implementation ArtistsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.artistController = [[ArtistsController alloc] init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.artistController.artists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    Artist *artist = [self.artistController.artists objectAtIndex:indexPath.row];
    cell.textLabel.text = artist.name;
    
    if (artist.yearFormed != 0)
    {
        NSString *yearFormedString = [NSString localizedStringWithFormat:@"Formed in %d", artist.yearFormed];
        cell.detailTextLabel.text = yearFormedString;
    } else
    {
        cell.detailTextLabel.text = nil;
    }
    
    return cell;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowArtistDetailSegue"]) {
                ArtistDetailViewController *artistDetailVC = [segue destinationViewController];
                NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Artist *artist = [self.artistController.artists objectAtIndex:indexPath.row];

                artistDetailVC.artist = artist;
                artistDetailVC.isShowingArtistDetail = YES;

            } else if ([[segue identifier] isEqualToString:@"ShowAddArtistSegue"]) {
                ArtistDetailViewController *artistDetailVC = [segue destinationViewController];

                artistDetailVC.isShowingArtistDetail = NO;
                artistDetailVC.artistController = self.artistController;
            }
    }

@end
