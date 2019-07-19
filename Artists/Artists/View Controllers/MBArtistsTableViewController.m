//
//  MBArtistsTableViewController.m
//  Artists
//
//  Created by Mitchell Budge on 7/19/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import "MBArtistsTableViewController.h"

@interface MBArtistsTableViewController ()

@end

@implementation MBArtistsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self.tableView reloadData];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _artistController = [[MBArtistController alloc]init];
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistController.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    MBArtist *artist = [[_artistController artists] objectAtIndex:indexPath.row];
    cell.textLabel.text = artist.artist;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %i", (int)artist.year];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        MBArtist *artist = [[[self artistController] artists] objectAtIndex:indexPath.row];
        [self.artistController deleteArtist: artist];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowArtist"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        MBArtist *artist = self.artistController.artists[indexPath.row];
        MBArtistDetailViewController *detailVC = segue.destinationViewController;
        detailVC.artistController = self.artistController;
        detailVC.artist = artist;
    }
    else if ([[segue identifier] isEqualToString:@"AddArtist"])
    {
        MBArtistDetailViewController *detailVC = segue.destinationViewController;
        detailVC.artistController = self.artistController;
    }
}

@end
