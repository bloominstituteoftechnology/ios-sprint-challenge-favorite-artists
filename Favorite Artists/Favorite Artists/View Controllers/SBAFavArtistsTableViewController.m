//
//  SBAFavArtistsTableViewController.m
//  Favorite Artists
//
//  Created by Sal B Amer on 5/29/20.
//  Copyright © 2020 Sal B AmerDEv. All rights reserved.
//

#import "SBAFavArtistsTableViewController.h"
#import "SBAArtist.h"
#import "SBAArtistModelController.h"
#import "SBADetailSearchViewController.h"
#import "SBAArtist+NSJSONSerialization.h"

@interface SBAFavArtistsTableViewController ()
@property (nonatomic) SBAArtistModelController *artistController;


@end

@implementation SBAFavArtistsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.artistController = [[SBAArtistModelController alloc] init];
  
    // create test Artist
  SBAArtist *testArtist = [[SBAArtist alloc] initWithArtistName:@"Bob Marley" biography:@"Jah Lives" yearFormed:1977];
  [self.tableView reloadData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.artistController.favoriteArtists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
  SBAArtist *artist = self.artistController.favoriteArtists[indexPath.row];
  cell.textLabel.text = artist.name;
  cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];
  return cell;
}


 
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"AddArtistsSegue"]) {
    SBADetailSearchViewController *searchVC = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//    searchVC.artist = self.artistController.favoriteArtists[indexPath.row];
    
  }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 

@end
