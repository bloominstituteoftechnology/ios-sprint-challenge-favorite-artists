//
//  CDBFavArtistTableViewController.m
//  FavoriteArtist
//
//  Created by Ciara Beitel on 11/8/19.
//  Copyright © 2019 Ciara Beitel. All rights reserved.
//

#import "CDBFavArtistTableViewController.h"
#import "CDBFavArtist.h"
#import "CDBFavArtistDetailViewController.h"
#import "CDBSearchViewController.h"

@interface CDBFavArtistTableViewController ()

@end

@implementation CDBFavArtistTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _favArtistController = [[CDBFavArtistController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.favArtistController.favArtists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    CDBFavArtist *favArtist = self.favArtistController.favArtists[indexPath.row];
    cell.textLabel.text = favArtist.name;
    cell.detailTextLabel.text = favArtist.year;
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        CDBFavArtist *favArtist = self.favArtistController.favArtists[indexPath.row];
        [self.favArtistController removeTask:favArtist];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddNewArtistSegue"]) {
        CDBSearchViewController *destinationVC = segue.destinationViewController;
        destinationVC.favArtistController = self.favArtistController;
    } else if ([segue.identifier isEqualToString:@"ShowArtistDetailFromCellSegue"]) {
    CDBFavArtistDetailViewController *destinationVC = segue.destinationViewController;
    NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
    destinationVC.favArtist = self.favArtistController.favArtists[indexPath.row];
    }
}

@end
