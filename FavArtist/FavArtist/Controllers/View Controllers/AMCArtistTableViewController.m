//
//  AMCArtistTableViewController.m
//  FavArtist
//
//  Created by Aaron Cleveland on 3/20/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

#import "AMCArtistTableViewController.h"
#import "AMCArtistTableViewController.h"
#import "AMCArtistDetailViewController.h"
#import "AMCArtist.h"
#import "AMCArtistController.h"

@interface AMCArtistTableViewController ()

@property (nonatomic, readonly) AMCArtistController *artistController;

@end

@implementation AMCArtistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.artistController loadArtist];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.artistController.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    AMCArtist *artist = [self.artistController.artists objectAtIndex:indexPath.row];
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %i", artist.yearFormed];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        AMCArtist *artist = [self.artistController.artists objectAtIndex:indexPath.row];
        [self.artistController removeArtist:artist];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DetailArtistSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        AMCArtistDetailViewController *detailVC = segue.destinationViewController;
        detailVC.artistController = self.artistController;
        detailVC.artist = self.artistController.artists[indexPath.row];
    } else {
        if ([segue.identifier isEqualToString:@"AddArtistSegue"]) {
        AMCArtistDetailViewController *detailVC = segue.destinationViewController;
        detailVC.artistController = self.artistController;
    }
    }
}

@synthesize artistController = _artistController;
- (AMCArtistController *)artistController
{
    if (!_artistController) {
        _artistController = [[AMCArtistController alloc] init];
    }
    return _artistController;
}

@end
