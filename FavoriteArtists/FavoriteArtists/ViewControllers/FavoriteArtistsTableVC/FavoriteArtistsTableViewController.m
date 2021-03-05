//
//  FavoriteArtistsTableViewController.m
//  FavoriteArtists
//
//  Created by James McDougall on 3/4/21.
//

#import "FavoriteArtistsTableViewController.h"
#import "ArtistDetailViewController.h"
#import "LSIArtistController.h"
#import "LSIArtist.h"


//MARK: - Interface -
@interface FavoriteArtistsTableViewController ()

///  Properties
@property (nonatomic) LSIArtistController *artistController;

@end



//MARK: - Implementation -
@implementation FavoriteArtistsTableViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    _artistController = [[LSIArtistController alloc] init];
    [self.tableView reloadData];
}

/// - Table View Data Source -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _artistController.savedArtists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    LSIArtist *artist = _artistController.savedArtists[indexPath.row];
    cell.textLabel.text = artist.name;
    
    ///  Re-using dumb code, if it works it works :)
    int yearFormedInt = [artist.yearFormed intValue];
    NSNumber *yearFormedNumber = [[NSNumber alloc] initWithInt:yearFormedInt];
    NSString *yearFormedString = [@"Formed in:" stringByAppendingString:[yearFormedNumber stringValue]];
    
    cell.detailTextLabel.text = [@"Formed in: " stringByAppendingString: yearFormedString];
    
    return cell;
}

/// - Navigation -
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier  isEqual: @"ArtistSearchSegue"]) {
        ArtistDetailViewController *detailVC = segue.destinationViewController;
        detailVC.isDetailView = false;
        NSLog(@"Segue path: Search mode");
    }
    else if ([segue.identifier isEqual: @"ArtistDetailSegue"]) {
        
        ArtistDetailViewController *detailVC = segue.destinationViewController;
        NSIndexPath *indexPath = [[self tableView] indexPathForSelectedRow];
        long index = indexPath.row;
        LSIArtist *tappedArtist = _artistController.savedArtists[index];
        
        [detailVC setArtist:tappedArtist];
        detailVC.isDetailView = true;
    }
}


@end
