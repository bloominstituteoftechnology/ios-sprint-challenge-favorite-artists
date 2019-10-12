//
//  LSIArtistTableViewController.m
//  FavoriteArtists
//
//  Created by Luqmaan Khan on 10/11/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

#import "LSIArtistTableViewController.h"
#import "LSIArtistDetailViewController.h"
#import "LSIArtist.h"
#import "LSIArtistController.h"

@interface LSIArtistTableViewController ()

@property NSMutableArray *tempArtists;
@property LSIArtistController *artistController;

@end

@implementation LSIArtistTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.artistController = [[LSIArtistController alloc] init];
    }
    return self;
}

- (void)viewDidLoad:(BOOL)animated {
    [super viewDidLoad];
     [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (!self.artistController) {
        self.artistController = [[LSIArtistController alloc] init];
      self.artist = [[LSIArtist alloc] init];
    }
    [self.tempArtists removeAllObjects];
    self.tempArtists = [self.artistController artistArray];
    [self.tableView reloadData];
}




#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tempArtists.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    LSIArtist *artist = self.tempArtists[indexPath.row];
    cell.textLabel.text = artist.artistName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)artist.formedYear];
    return cell;
}


//AddArtist
//ShowArtist
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 
    if ([segue.identifier isEqualToString:@"ShowArtist"]) {
           NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
           LSIArtistDetailViewController *detailVC = segue.destinationViewController;
        detailVC.controller = self.artistController;
          detailVC.artist = [self tempArtists][indexPath.row];
       }
       
       if ([segue.identifier isEqualToString:@"AddArtist"]) {
           LSIArtistDetailViewController *detailVC = segue.destinationViewController;
           detailVC.controller = self.artistController;
       }
    
    
}


@end
