//
//  MJPArtistsTableViewController.m
//  Artists
//
//  Created by Mark Poggi on 6/12/20.
//  Copyright © 2020 Mark Poggi. All rights reserved.
//

#import "MJPArtistsTableViewController.h"

@interface MJPArtistsTableViewController ()

@end

@implementation MJPArtistsTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _artistController = [[MJPArtistController alloc]init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.artistController loadfromPersistentStore];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistController.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    MJPArtist *artist = [[_artistController artists] objectAtIndex:indexPath.row];

    cell.textLabel.text = artist.strArtist;

    if (artist.yearFormed != 0 ) {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %i", (int)artist.yearFormed];
    } else {
        cell.detailTextLabel.text = @"Date formed unavailable.";
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        MJPArtist *artist = [[[self artistController] artists] objectAtIndex:indexPath.row];
        [self.artistController deleteArtist:artist];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowArtistSegue"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        MJPArtist *artist = self.artistController.artists[indexPath.row];
        MJPArtistsViewController *detailVC = segue.destinationViewController;
        detailVC.artistController = self.artistController;
        detailVC.artist = artist;
    }
    else if ([[segue identifier] isEqualToString:@"AddArtistSegue"])
    {
        MJPArtistsViewController *detailVC = segue.destinationViewController;
        detailVC.artistController = self.artistController;
    }
}

@end
