//
//  FavoriteArtistTableViewController.m
//  FavoriteArtists
//
//  Created by Craig Belinfante on 11/22/20.
//

#import "FavoriteArtistTableViewController.h"
#import "FavoriteArtist.h"
#import "ArtistFetcher.h"
#import "AddArtistViewController.h"

@interface FavoriteArtistTableViewController ()

@end

@implementation FavoriteArtistTableViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    [self.tableView reloadData];
//}
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _artistsFetcher = [[ArtistFetcher alloc] init];
    }
    return self;
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.artistsFetcher.artists count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    // Configure the cell...
    FavoriteArtist *artist = self.artistsFetcher.artists[indexPath.row];
    
    cell.textLabel.text = artist.artist;
    cell.detailTextLabel.text = [[NSString alloc] initWithFormat:@"Formed in %i", artist.year];
    
    return cell;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddNewArtist"]) {
        AddArtistViewController *destinationVC = (AddArtistViewController *)[segue destinationViewController];
        destinationVC.artistsFetcher = self.artistsFetcher;
        
    } else if ([segue.identifier isEqualToString:@"ShowArtist"]){
        AddArtistViewController *destinationVC = (AddArtistViewController *)[segue destinationViewController];
        destinationVC.artistsFetcher = self.artistsFetcher;
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        FavoriteArtist *artist = self.artistsFetcher.artists[indexPath.row];
        
        destinationVC.artist = artist;
    
    }
}


@end
