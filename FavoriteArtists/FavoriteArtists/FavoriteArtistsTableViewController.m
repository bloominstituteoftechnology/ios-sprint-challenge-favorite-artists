//
//  FavoriteArtistsTableViewController.m
//  FavoriteArtists
//
//  Created by Clayton Watkins on 9/25/20.
//

#import "FavoriteArtistsTableViewController.h"
#import "Artist.h"
#import "SearchDetailViewController.h"
#import "ArtistPersistenceController.h"

@interface FavoriteArtistsTableViewController ()

@property ArtistPersistenceController *persistenceController;

@end

@implementation FavoriteArtistsTableViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.persistenceController = [[ArtistPersistenceController alloc] init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.persistenceController.artists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    Artist *artist = [self.persistenceController.artists objectAtIndex:indexPath.row];
    cell.textLabel.text = artist.artistName;
    
    if (artist.yearFormed != 0) {
        NSString *yearFromedString = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];
        cell.detailTextLabel.text = yearFromedString;
    } else {
        cell.detailTextLabel.text = nil;
    }

    return cell;
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"AddArtistSegue"]) {
        SearchDetailViewController *addArtistVC = [segue destinationViewController];
        addArtistVC.isShowingFavoriteArtistDetail = NO;
        addArtistVC.persistenceController = self.persistenceController;
    } else if ([[segue identifier] isEqualToString:@"ArtistDetailSegue"]){
        SearchDetailViewController *artistDetailViewVC = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Artist *artist = [self.persistenceController.artists objectAtIndex:indexPath.row];
        
        artistDetailViewVC.artist = artist;
        artistDetailViewVC.isShowingFavoriteArtistDetail = YES;
    }
}


@end
