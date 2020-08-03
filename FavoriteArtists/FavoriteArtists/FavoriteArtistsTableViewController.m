//
//  FavoriteArtistsTableViewController.m
//  FavoriteArtists
//
//  Created by Kelson Hartle on 8/2/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

#import "FavoriteArtistsTableViewController.h"
#import "ArtistDetailViewController.h"
#import "LSIArtistController.h"
#import "LSIArtist.h"

@interface FavoriteArtistsTableViewController ()

@property (nonatomic) LSIArtistController *fetcher;
@property NSMutableArray *savedArtists;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation FavoriteArtistsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SearchArtistSegue"]) {
        ArtistDetailViewController * fetcher = (ArtistDetailViewController *)segue.destinationViewController;
        fetcher.fetcher = self.fetcher;
    }
    
    if ([segue.identifier isEqualToString:@"ShowDetailSegue"]) {
        ArtistDetailViewController *controller = (ArtistDetailViewController *) segue.destinationViewController;
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        controller.artist = self.savedArtists[selectedIndexPath.row];
    }
}

@end
