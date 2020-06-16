//
//  FavoriteArtistsTableViewController.m
//  FavoriteArtists
//
//  Created by Jessie Ann Griffin on 5/29/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

#import "FavoriteArtistsTableViewController.h"
#import "ArtistController.h"
#import "ArtistDetailViewController.h"
#import "Artist.h"

@interface FavoriteArtistsTableViewController ()

@property (nonatomic, readonly) Artist *artist;

@end

@implementation FavoriteArtistsTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _artistController = [[ArtistController alloc] init];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"Artist count: %ld", (long)self.artistController.artistCount);
    [self.tableView reloadData];
    [self.artistController loadFromPersistentStore];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.artistController loadFromPersistentStore];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistController.artistCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    Artist *cellArtist = [self.artistController artistAtIndex:indexPath.row];
    cell.textLabel.text = cellArtist.artistName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Year formed %d", cellArtist.yearFormed];
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier  isEqual:@"SearchArtistSegue"]) {

        NSLog(@" Search segue");

        ArtistDetailViewController *detailVC = segue.destinationViewController;

            detailVC.title = @"Add New Artist";
        detailVC.artistController = self.artistController;


    } else {
        NSLog(@" Detail segue");
        ArtistDetailViewController *detailVC = segue.destinationViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        detailVC.artist = [self.artistController artistAtIndex:indexPath.row];
    }
}

@end
