//
//  FavoriteArtistsTableViewController.m
//  FavoriteArtists
//
//  Created by Jessie Ann Griffin on 5/29/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

#import "FavoriteArtistsTableViewController.h"
#import "ArtistController.h"
#import "ArtistDetailViewController.h"

@interface FavoriteArtistsTableViewController ()

@property (nonatomic) NSArray<Artist *> *favoriteArtists;
@property (nonatomic) ArtistController *artistController;
@property (nonatomic, readonly) Artist *artist;

@end

@implementation FavoriteArtistsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _artistController = [[ArtistController alloc] init];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistController.artists.count;
}

- (IBAction)addArtistButtonTapped:(UIBarButtonItem *)sender {
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    Artist *cellArtist = self.artistController.artists[indexPath.row];
    cell.textLabel.text = cellArtist.artistName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Year formed %d", cellArtist.yearFormed];
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqual:@"SearchArtistSegue"]) {
        ArtistDetailViewController *detailVC = [[ArtistDetailViewController alloc] init];
        if ([detailVC isKindOfClass:[ArtistDetailViewController class]])
        {
            detailVC.title = @"Add New Artist";
        }
    } else {
        ArtistDetailViewController *detailVC = [[ArtistDetailViewController alloc] init];
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        detailVC.artist = self.artistController.artists[indexPath.row];
    }
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

@end
