//
//  MRFArtistListTableViewController.m
//  PXFavArtist
//
//  Created by Michael Flowers on 7/19/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

#import "MRFArtistListTableViewController.h"
#import "MRFArtistController.h"
#import "MRFArtist.h"
#import "MRFAddorShowArtistViewController.h"

@interface MRFArtistListTableViewController ()

@end

@implementation MRFArtistListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //CALL LOAD FROM PERSISTENCE STORE
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

//initialize the artistController as a lazy property
- (MRFArtistController *)artistController {
    if (_artistController == nil){
        _artistController = [[MRFArtistController alloc] init];
    }
    return _artistController;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistController.artists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    // Configure the cell...
    MRFArtist *artist = self.artistController.artists[indexPath.row];
    cell.textLabel.text = artist.artist;
    cell.detailTextLabel.text = artist.bio;
    return cell;
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"ToAdd"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        MRFArtist *artist = self.artistController.artists[indexPath.row];
        
        //cast the destination
        MRFAddorShowArtistViewController *detailVC = segue.destinationViewController;
        detailVC.artistContrller = self.artistController;
        detailVC.artist = artist;
    }
}

@end
