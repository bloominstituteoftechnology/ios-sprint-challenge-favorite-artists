//
//  FavArtistTableViewController.m
//  FavoriteArtists
//
//  Created by Ufuk Türközü on 17.04.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

#import "UFOFavArtistTableViewController.h"
#import "UFOAPIController.h"
#import "UFOSearchViewController.h"
#import "UFOArtist.h"
#import "UFOArtist+NSJSONSerialization.h"

@interface UFOFavArtistTableViewController ()

@property (nonatomic, strong) UFOAPIController *apiController;

@end

@implementation UFOFavArtistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _apiController = [[UFOAPIController alloc] init];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _apiController = [[UFOAPIController alloc] init];
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.apiController.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    UFOArtist *artist = self.apiController.artists[indexPath.row];
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat: @"%li", (long)artist.yearFormed];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"SearchSegue"]) {
        UFOSearchViewController *searchVC = segue.destinationViewController;
        searchVC.apiController = self.apiController;
    } else if ([segue.identifier isEqualToString:@"DetailSegue"]) {
        UFOSearchViewController *detailVC = segue.destinationViewController;
        detailVC.apiController = self.apiController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        detailVC.artist = self.apiController.artists[indexPath.row];
    }
}

@end
