//
//  ViewController.m
//  Art
//
//  Created by Nick Nguyen on 4/17/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

#import "NPTFavoriteArtistTableViewController.h"
#import "NPTArtistController.h"
#import "NPTArtist.h"
#import "NPTArtistDetailViewController.h"

@interface NPTFavoriteArtistTableViewController ()

@end

@implementation NPTFavoriteArtistTableViewController


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _controller = [[NPTArtistController alloc]init];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.controller loadFromPersistentStore];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    
}


- (IBAction)addPressed:(UIBarButtonItem *)sender {
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.controller.savedArtists.count;
}
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtCell" forIndexPath:indexPath];
    
    NPTArtist *artist = self.controller.savedArtists[indexPath.row];
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d",artist.yearFormed];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NPTArtistDetailViewController *detailVC = segue.destinationViewController;
    detailVC.artistController = self.controller;
    
    if ([segue.identifier isEqualToString:@"CellSegue"]) {
        NPTArtist *artist = self.controller.savedArtists[indexPath.row];
        detailVC.artist = artist;
    }
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NPTArtist *artist = self.controller.savedArtists[indexPath.row];
        [self.controller removeArtist:artist];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
     
    }
}



@end
