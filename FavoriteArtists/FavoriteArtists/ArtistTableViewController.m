//
//  ArtistTableViewController.m
//  FavoriteArtists
//
//  Created by Bohdan Tkachenko on 11/30/20.
//

#import "ArtistTableViewController.h"
#import "Artist.h"
#import "ArtistController.h"
#import "ArtistDetailViewController.h"

@interface ArtistTableViewController ()

@property (nonatomic) ArtistController *artistController;

@end

@implementation ArtistTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    _artistController = [[ArtistController alloc] init];
    [self.artistController loadFromPersistentStore];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _artistController.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    cell.textLabel.text = [_artistController.artists objectAtIndex:indexPath.row].artistName;
    if ([_artistController.artists objectAtIndex:indexPath.row].formedYear > 0) {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", [_artistController.artists objectAtIndex:indexPath.row].formedYear];
    } else {
        cell.detailTextLabel.text = @"year founded is unknown";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_artistController.artists removeObjectAtIndex:indexPath.row];
        [_artistController saveToPersistentStore];
        [self.tableView reloadData];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ArtistDetail"]) {
        ArtistDetailViewController *detailVC = (ArtistDetailViewController *)segue.destinationViewController;
        detailVC.artistController = _artistController;
        detailVC.artist = [_artistController.artists objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    } else if ([segue.identifier isEqualToString:@"AddArtist"]) {
        ArtistDetailViewController *detailVC = (ArtistDetailViewController *)segue.destinationViewController;
        detailVC.artistController = _artistController;
    }
}

@end
