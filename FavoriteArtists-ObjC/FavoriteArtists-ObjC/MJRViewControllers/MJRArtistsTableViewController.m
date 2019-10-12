//
//  MJRArtistsTableViewController.m
//  FavoriteArtists-ObjC
//
//  Created by Marlon Raskin on 10/11/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

#import "MJRArtistsTableViewController.h"
#import "MJRArtistDetailViewController.h"
#import "MJRArtistController.h"
#import "MJRArtist.h"

@interface MJRArtistsTableViewController ()

@property NSMutableArray *artistArray;
@property MJRArtistController *artistController;

@end

@implementation MJRArtistsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    if (!self.artistController) {
        self.artistController = [[MJRArtistController alloc] init];
        self.artist = [[MJRArtist alloc] init];
    }

    [self.artistArray removeAllObjects];
    self.artistArray = [self.artistController favoriteArtists];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    MJRArtist *artist = self.artistArray[indexPath.row];

    NSString *yearStr = @"";
    NSString *noYearStr = @"Year not available.";
    NSString *fullYearStr = [NSString stringWithFormat:@"Year formed: %d", artist.yearFormed];

    if (artist.yearFormed == 0) {
        yearStr = noYearStr;
    } else {
        yearStr = fullYearStr;
    }

    cell.textLabel.text = artist.artistName;
    cell.detailTextLabel.text = yearStr;
    
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SearchArtistSegue"]) {
        MJRArtistDetailViewController *detailVC = [segue destinationViewController];
        detailVC.artistController = self.artistController;
    } else {
        MJRArtistDetailViewController *detailVC = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        detailVC.artistController = self.artistController;
        detailVC.artist = self.artistArray[indexPath.row];
    }

}


@end
