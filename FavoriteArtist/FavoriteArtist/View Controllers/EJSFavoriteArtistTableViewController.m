//
//  EJSFavoriteArtistTableViewController.m
//  FavoriteArtist
//
//  Created by Enzo Jimenez-Soto on 7/17/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

#import "EJSFavoriteArtistTableViewController.h"
#import "EJSDetailViewController.h"
#import "EJSFavoriteArtist.h"
#import "EJSFavoriteArtistController.h"

@implementation EJSFavoriteArtistTableViewController

// MARK: - Properties

// let modelController = ModelController()
- (EJSFavoriteArtistController *)favoriteArtistController {
    
    if (!_favoriteArtistController) {
        _favoriteArtistController = [[EJSFavoriteArtistController alloc] init];
    }
    return _favoriteArtistController;
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
    return [[self.favoriteArtistController favoriteArtists] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    EJSFavoriteArtist *favoriteArtist = self.favoriteArtistController.favoriteArtists[indexPath.row];
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
    
    // ADD
    if ([segue.identifier isEqualToString:@"AddArtistSegue"]) {
        EJSDetailViewController *detailVC = segue.destinationViewController;
        detailVC.favoriteArtistController = self.favoriteArtistController;
    }
    
    // VIEW
    if ([segue.identifier isEqualToString:@"ShowArtistSegue"]) {
        EJSDetailViewController *detailVC = segue.destinationViewController;
        detailVC.favoriteArtistController = self.favoriteArtistController;
        
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        detailVC.favoriteArtist = self.favoriteArtistController.favoriteArtists[indexPath.row];
    }
}

@end
