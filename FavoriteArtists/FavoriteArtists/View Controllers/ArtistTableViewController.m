//
//  ArtistTableViewController.m
//  FavoriteArtists
//
//  Created by Chris Gonzales on 4/17/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

#import "ArtistTableViewController.h"
#import "CDGArtist.h"
#import "CDGArtistController.h"

@interface ArtistTableViewController ()

@property (nonatomic, readonly) CDGArtistController *artistController;
@property NSMutableArray *favoriteArtistsArray;

@end

@implementation ArtistTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *loadedArtists = [self.artistController loadFavoriteArtists];
    self.favoriteArtistsArray = [[NSMutableArray alloc]initWithArray:loadedArtists];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.favoriteArtistsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    CDGArtist *artistName = self.favoriteArtistsArray[indexPath.row];
    cell.textLabel.text = artistName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in: %ld", (long)artistName.formedYear];
 
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"AddArtistSegue"])
       {
           ArtistDetailViewController *detailVC = [segue destinationViewController];
           
           detailVC.artistController = self.artistController;
       }
       
       if ([[segue identifier] isEqualToString:@"DetailViewSegue"])
       {
           ArtistDetailViewController *detailVC = [segue destinationViewController];
           NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
           
           detailVC.artistController = self.artistController;
           detailVC.artist = [self.favoritedArtists objectAtIndex:indexPath.row];
       }
}


@end
