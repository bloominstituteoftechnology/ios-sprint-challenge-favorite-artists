//
//  JLAFavoriteArtistsTableViewController.m
//  FavoriteArtistsSprint
//
//  Created by Jorge Alvarez on 3/20/20.
//  Copyright © 2020 Jorge Alvarez. All rights reserved.
//

#import "JLAFavoriteArtistsTableViewController.h"
#import "JLAFavoriteArtistController.h"
#import "JLAFavoriteArtist.h"
#import "JLADetailViewController.h"

@implementation JLAFavoriteArtistsTableViewController

// MARK: - Properties

// let modelController = ModelController()
- (JLAFavoriteArtistController *)favoriteArtistController {
    
    if (!_favoriteArtistController) {
        _favoriteArtistController = [[JLAFavoriteArtistController alloc] init];
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
    
    JLAFavoriteArtist *favoriteArtist = self.favoriteArtistController.favoriteArtists[indexPath.row];
    cell.textLabel.text = favoriteArtist.strArtist;
    if ( favoriteArtist.intFormedYear == 0 ) {
        cell.detailTextLabel.text = @"";
    }
    else {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %i", favoriteArtist.intFormedYear];
    }
        
    return cell;
}

// MARK: - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // ADD
    if ([segue.identifier isEqualToString:@"AddArtistSegue"]) {
        JLADetailViewController *detailVC = segue.destinationViewController;
        detailVC.favoriteArtistController = self.favoriteArtistController;
    }
    
    // VIEW
    if ([segue.identifier isEqualToString:@"ShowArtistSegue"]) {
        JLADetailViewController *detailVC = segue.destinationViewController;
        detailVC.favoriteArtistController = self.favoriteArtistController;
        
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        detailVC.favoriteArtist = self.favoriteArtistController.favoriteArtists[indexPath.row];
    }
}

@end
