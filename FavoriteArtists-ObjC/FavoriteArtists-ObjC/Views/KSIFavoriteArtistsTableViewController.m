//
//  KSIFavoriteArtistsTableViewController.m
//  FavoriteArtists-ObjC
//
//  Created by Kevin Stewart on 7/31/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

#import "KSIFavoriteArtistsTableViewController.h"
#import "../Controller/KSIArtistController.h"
#import "KSIArtist.h"
#import "KSISearchForArtistViewController.h"
#import "KSIArtistDetailViewController.h"

@interface KSIFavoriteArtistsTableViewController ()

@end

@implementation KSIFavoriteArtistsTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _ksiArtistController = [[KSIArtistController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.ksiArtistController.artistCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    KSIArtist *artist = self.ksiArtistController.artists[indexPath.row];
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %i", (int)artist.yearArtistFormed];
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"SearchNewArtistsSegue"]) {
        KSISearchForArtistViewController *detailVC = segue.destinationViewController;
        detailVC.ksiArtistController = self.ksiArtistController;
            } else if ([segue.identifier isEqualToString:@"ArtistsDetailSegue"])
            {
                NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
                KSIArtistDetailViewController *detailVC = segue.destinationViewController;
                KSIArtist *artist = self.ksiArtistController.artists[indexPath.row];
                detailVC.ksiArtist = artist;
    }
}


@end
