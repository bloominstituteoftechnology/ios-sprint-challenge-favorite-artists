//
//  HSIArtistsTableViewController.m
//  Favorite Artists
//
//  Created by Kenny on 6/12/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

#import "HSIArtistsTableViewController.h"
#import "HSIArtistDetailViewController.h"
#import "HSIArtistController.h"
#import "HSIArtist.h"

@interface HSIArtistsTableViewController ()

@end

@implementation HSIArtistsTableViewController

// MARK: - View Lifecycle -

- (void)viewDidLoad {
    [super viewDidLoad];
    _controller = [[HSIArtistController alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}


// MARK:  - Table View Data Source -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.controller.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];

    HSIArtist *artist = self.controller.artists[indexPath.row];

    cell.textLabel.text = artist.name;

    if (artist.year == 0) {
        cell.detailTextLabel.text = @"";
    } else {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %ld", artist.year];
    }
    return cell;
}

// MARK: - Navigation -

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ViewArtist"]) {
        HSIArtistDetailViewController *destinationVC = (HSIArtistDetailViewController *)[segue destinationViewController];
        //DEV COMMENT: may need to be NSIndexPath and add row to subscript. long doesn't seem right for the type
        long row = self.tableView.indexPathForSelectedRow.row;
        HSIArtist *artist = self.controller.artists[row];

        destinationVC.artist = artist;
        destinationVC.controller = self.controller;

    } else if ([segue.identifier isEqualToString:@"AddArtist"]) {
        HSIArtistDetailViewController *destinationVC = (HSIArtistDetailViewController *)[segue destinationViewController];
        destinationVC.controller = self.controller;
    }
}

@end
