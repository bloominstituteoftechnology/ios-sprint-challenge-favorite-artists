//
//  SDJHomeVC.m
//  FavoriteArtists
//
//  Created by Shawn James on 6/12/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

#import "SDJHomeVC.h"
#import "SDJArtistClient.h"
#import "SDJArtist.h"
#import "SDJDetailVC.h"

@interface SDJHomeVC ()

@property (nonatomic) SDJArtistClient *artistClient;
@property (nonatomic) NSMutableArray *savedArtist;

@end

@implementation SDJHomeVC

#pragma mark - Lifecycle & init

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSArray *tempArtist = [self.artistClient loadSavedArtistsFromDocumentsDirectory];
    self.savedArtist = [[NSMutableArray alloc] initWithArray:tempArtist];
    [self.tableView reloadData];
}

- (SDJArtistClient *)artistClient {
    if (_artistClient == nil) {
        _artistClient = [[SDJArtistClient alloc] init];
    }
    return _artistClient;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.savedArtist.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    SDJArtist *artist = self.savedArtist[indexPath.row];
    if (artist.yearFormed != 0) {
        cell.textLabel.text = artist.artistName;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];
    } else {
        cell.textLabel.text = artist.artistName;
        cell.detailTextLabel.text = @"No Results";
    }
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddArtistSeg"]) {
        SDJDetailVC *detailVC = (SDJDetailVC *)segue.destinationViewController;
        detailVC.artistClient = self.artistClient;
    } else if ([segue.identifier isEqualToString:@"ShowDetailSeg"]) {
        SDJDetailVC *detailVC = (SDJDetailVC *)segue.destinationViewController;
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        detailVC.artist = self.savedArtist[selectedIndexPath.row];
    }
}

@end
