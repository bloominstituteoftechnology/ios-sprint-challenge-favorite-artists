//
//  ArtistTableViewController.m
//  Favorite Artists
//
//  Created by Michael Stoffer on 11/9/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

#import "ArtistTableViewController.h"
#import "ArtistDetailViewController.h"
#import "ArtistFetcher.h"
#import "Artist.h"

@interface ArtistTableViewController ()

@property (nonatomic, readonly) ArtistFetcher *artistFetcher;

@end

@implementation ArtistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.artistFetcher loadArtists];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistFetcher.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    Artist *artist = [self.artistFetcher.artists objectAtIndex:indexPath.row];
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %i", artist.yearFormed];
    
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Artist *artist = [self.artistFetcher.artists objectAtIndex:indexPath.row];
        [self.artistFetcher removeArtist:artist];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"EditArtist"]) {
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        ArtistDetailViewController *detailVC = segue.destinationViewController;
        
        detailVC.artistFetcher = self.artistFetcher;
        detailVC.artist = [self.artistFetcher.artists objectAtIndex:indexPath.row];
    } else if ([segue.identifier isEqualToString:@"AddArtist"]) {
        ArtistDetailViewController *detailVC = segue.destinationViewController;
        detailVC.artistFetcher = self.artistFetcher;
    }
}

@synthesize artistFetcher = _artistFetcher;
- (ArtistFetcher *)artistFetcher
{
    if (!_artistFetcher) {
        _artistFetcher = [[ArtistFetcher alloc] init];
    }
    return _artistFetcher;
}

@end
