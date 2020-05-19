//
//  ArtistListTableViewController.m
//  FavoriteArtists
//
//  Created by Lambda_School_Loaner_268 on 5/18/20.
//  Copyright © 2020 Lambda. All rights reserved.
//

#import "MSKArtistListTableViewController.h"
#import "MSKArtistDetailViewController.h"
#import "MSKArtistController.h"
@interface MSKArtistListTableViewController () <UITableViewDataSource>
@end
@implementation MSKArtistListTableViewController
-(instancetype)init {
    self = [super init];
    if (self) {
        _controller = [[MSKArtistController alloc] init];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.controller = [[MSKArtistController alloc] init];
    [self.controller loadArtistsFromPersistence:^(NSError *_Nullable error) {
        if (error) {
            NSLog(@"Error loading from persistence!");
            return;
        }
        self.artists = self.controller.artists;
    }];
    [self.tableView reloadData];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    [self.controller loadArtistsFromPersistence:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error loading from persistence!");
            return;
        }
        self.artists = self.controller.artists;
    }];
    [self.tableView reloadData];
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.controller.artists.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"artistCell"
                                                            forIndexPath:indexPath];
    MSKArtist *artist = self.controller.artists[indexPath.row];
    cell.textLabel.text = artist.artistName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %i", artist.yearFormed];
    return cell;
}
#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailSegue"]) {
        MSKArtistDetailViewController *detailVC = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        detailVC.artist = self.controller.artists[indexPath.row];
        detailVC.controller = self.controller;
    } else  {
        if ([segue.identifier isEqualToString:@"searchSegue"]) {
           MSKArtistDetailViewController *searchArtist = segue.destinationViewController;
            searchArtist.controller = self.controller;
        }
    }
}
@end
