//
//  EGCArtistsTableViewController.m
//  FavoriteArtists
//
//  Created by Enrique Gongora on 4/17/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

#import "EGCArtistsTableViewController.h"
#import "EGCArtistController.h"
#import "EGCArtist.h"
#import "EGCArtistDetailViewController.h"

@interface EGCArtistsTableViewController ()

@end

@implementation EGCArtistsTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _controller = [[EGCArtistController alloc] init];
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
    NSLog(@"viewWillAppear");
}

// MARK: - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.controller.savedArtists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    EGCArtist *artist = self.controller.savedArtists[indexPath.row];
    NSString *dateString = [self yearString:artist];
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = dateString;
    return cell;
}

- (NSString *)yearString:(EGCArtist *)artist {
    if (artist.year != 0) {
        return [NSString stringWithFormat:@"%i", artist.year];
    } else {
        return @"Not available";
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        EGCArtist *artist = self.controller.savedArtists[indexPath.row];
        [self.controller removeArtist:artist];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

// MARK: - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    EGCArtistDetailViewController *detailVC = segue.destinationViewController;
    detailVC.artistController = self.controller;
    
    if ([segue.identifier isEqualToString:@"ShowArtistDetailSegue"]) {
        EGCArtist *artist = self.controller.savedArtists[indexPath.row];
        detailVC.artist = artist;
    }
}

@end
