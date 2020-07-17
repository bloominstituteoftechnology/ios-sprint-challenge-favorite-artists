//
//  NNEArtistTableViewController.m
//  FavoriteArtists
//
//  Created by Nonye on 7/17/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

#import "NNEArtistTableViewController.h"
#import "NNEArtist.h"
#import "NNEArtistController.h"
#import "NNEArtist+NSJSONSerialization.h"
#import "ArtistDetailViewController.h"

@implementation NNEArtistTableViewController

- (NNEArtistController *)artistController {
    
    if (!_artistController) {
        _artistController = [[NNEArtistController alloc] init];
    }
    return _artistController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.artistController myArtists] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    NNEArtist *favoriteArtist = self.artistController.myArtists[indexPath.row];
    cell.textLabel.text = favoriteArtist.artist;
    if ( favoriteArtist.yearFormed == 0 ) {
        cell.detailTextLabel.text = @"";
    }
    else {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Started career in %i", favoriteArtist.yearFormed];
    }
        
    return cell;
}

// MARK: - NAVIGATION

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // ADD
    if ([segue.identifier isEqualToString:@"AddArtistSegue"]) {
        ArtistDetailViewController *detailVC = segue.destinationViewController;
        detailVC.nneArtistController = self.artistController;
    }
    
    // VIEW
    if ([segue.identifier isEqualToString:@"ArtistDetailSegue"]) {
        ArtistDetailViewController *detailVC = segue.destinationViewController;
        detailVC.nneArtistController = self.artistController;
        
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        detailVC.nneArtist = self.artistController.myArtists[indexPath.row];
    }
}

@end
