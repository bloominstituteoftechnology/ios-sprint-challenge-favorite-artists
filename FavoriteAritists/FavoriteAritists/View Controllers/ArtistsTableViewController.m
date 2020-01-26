//
//  ArtistsTableViewController.m
//  FavoriteAritists
//
//  Created by brian vilchez on 1/24/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

#import "ArtistsTableViewController.h"
#import "ArtistController.h"
#import "Artist.h"
#import "AddArtistViewController.h"
#import "ArtistDetailViewController.h"

@interface ArtistsTableViewController ()

@end

@implementation ArtistsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self artistController]loadFromUserDefaults];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self != nil) {
        _artistController = [[ArtistController alloc] init];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self != nil) {
        _artistController = [[ArtistController alloc] init];
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[self artistController]artists]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    Artist *artist = [[[self artistController]artists]objectAtIndex:indexPath.row];
    [[cell textLabel] setText:artist.artistName];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"formed in year %i", artist.yearFormed];
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ArtistDetailSegue"]) {
        NSIndexPath *indexPath = [[self tableView] indexPathForSelectedRow];
        ArtistDetailViewController *ArtistDetailVC = segue.destinationViewController;
        ArtistDetailVC.artist = [[[self artistController]artists]objectAtIndex:indexPath.row];
        ArtistDetailVC.artistController = [self artistController];
    } else if ([segue.identifier isEqualToString:@"AddArtistSegue"]) {
        AddArtistViewController *addArtistVC = segue.destinationViewController;
        addArtistVC.artistController = [self artistController];
    }
}


@end
