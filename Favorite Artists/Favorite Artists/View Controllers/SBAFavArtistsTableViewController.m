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
  SBAArtist *testArtist = [[SBAArtist alloc] initWithArtistName:@"Bob Marley" biography:@"Dummy data to check if working..Jah Lives" yearFormed:1974];
  [self.artistController.favoriteArtists addObject:testArtist];
  [self.tableView reloadData];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
  for (SBAArtist *artist in self.artistController.favoriteArtists) {
    [self.tableView reloadData];
    //save to persistance store here
  }
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
  if ([segue.identifier isEqualToString:@"ViewArtistDetailSegue"]) {
    SBADetailSearchViewController *searchVC = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    searchVC.artist = self.artistController.favoriteArtists[indexPath.row];
    searchVC.artistController = self.artistController;
  } else if ([segue.identifier isEqualToString:@"AddArtistsSegue"]){
    SBADetailSearchViewController *detailsVC = [segue destinationViewController];
    detailsVC.artistController = self.artistController;
  }
}
 

@end
