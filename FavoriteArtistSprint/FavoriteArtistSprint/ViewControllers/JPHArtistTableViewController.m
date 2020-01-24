//
//  JPHArtistTableViewController.m
//  FavoriteArtistSprint
//
//  Created by Jerry haaser on 1/24/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

#import "JPHArtistTableViewController.h"
#import "JPHArtistDetailViewController.h"
#import "JPHArtistController.h"
#import "JPHArtist.h"

@interface JPHArtistTableViewController ()

@property NSMutableArray *artistArray;
@property JPHArtistController *artistController;

@end

@implementation JPHArtistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [UIView new];
    
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (!self.artistController) {
        self.artistController = [[JPHArtistController alloc] init];
        self.artist = [[JPHArtist alloc] init];
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
    
    JPHArtist *artist = self.artistArray[indexPath.row];
    
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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SearchArtistSegue"]) {
        JPHArtistDetailViewController *detailVC = [segue destinationViewController];
        detailVC.artistController = self.artistController;
    } else {
        JPHArtistDetailViewController *detailVC = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        detailVC.artistController = self.artistController;
        detailVC.artist = self.artistArray [indexPath.row];
    }
}


@end
