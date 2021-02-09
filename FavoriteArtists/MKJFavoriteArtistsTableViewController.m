//
//  MKJFavoriteArtistsTableViewController.m
//  FavoriteArtists
//
//  Created by Kenneth Jones on 12/3/20.
//

#import "MKJFavoriteArtistsTableViewController.h"
#import "MKJArtistFetcher.h"
#import "MKJAddArtistViewController.h"
#import "MKJViewArtistViewController.h"

@interface MKJFavoriteArtistsTableViewController ()

@property (nonatomic) MKJArtistFetcher *fetcher;

@end

@implementation MKJFavoriteArtistsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fetcher = [[MKJArtistFetcher alloc] init];
    
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"🏆 The view has now appeared!");
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.fetcher.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    MKJArtist *artist = self.fetcher.artists[indexPath.row];
    cell.textLabel.text = artist.artist;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %i", artist.year];
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddArtistSegue"]) {
        MKJAddArtistViewController *detailVC = [segue destinationViewController];
        detailVC.fetcher = self.fetcher;
    } else if ([segue.identifier isEqualToString:@"ViewArtistSegue"]) {
        MKJViewArtistViewController *detailVC = [segue destinationViewController];
        detailVC.fetcher = self.fetcher;
        detailVC.artist = self.fetcher.artists[[self.tableView indexPathForSelectedRow].row];
    }
}

@end
