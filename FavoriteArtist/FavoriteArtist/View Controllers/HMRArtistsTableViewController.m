//
//  HMRArtistsTableViewController.m
//  FavoriteArtist
//
//  Created by Harmony Radley on 7/17/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

#import "HMRArtistsTableViewController.h"
#import "HMRArtist.h"
#import "HMRArtistController.h"
#import "HMRArtistsViewController.h"

@interface HMRArtistsTableViewController ()

@property (nonatomic) HMRArtistController *artistController;

@end

@implementation HMRArtistsTableViewController


// MARK: - Properties

- (HMRArtistController *)artistController {

    if (!_artistController) {
        _artistController = [[HMRArtistController alloc] init];
    }
    return _artistController;
}

// MARK: - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

// MARK: - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.artistController favoriteArtists] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];

    HMRArtist *favoriteArtist = self.artistController.favoriteArtists[indexPath.row];
    cell.textLabel.text = favoriteArtist.artist;
    if ( favoriteArtist.yearFormed == 0 ) {
        cell.detailTextLabel.text = @"";
    }
    else {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %i", favoriteArtist.yearFormed];
    }

    return cell;
}

// MARK: - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"AddArtistSegue"]) {
        HMRArtistsViewController *detailVC = segue.destinationViewController;
        detailVC.artistController = self.artistController;
    }

    if ([segue.identifier isEqualToString:@"DisplayArtistSegue"]) {
        HMRArtistsViewController *detailVC = segue.destinationViewController;
        detailVC.artistController = self.artistController;

        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        detailVC.favoriteArtist = self.artistController.favoriteArtists[indexPath.row];
    }
}
@end
