//
//  TXCArtistTableViewController.m
//  FavoriteArtists
//
//  Created by Thomas Cacciatore on 7/19/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

#import "TXCArtistTableViewController.h"
#import "TXCArtistController.h"
#import "TXCArtist.h"
#import "TXCArtistDetailViewController.h"

@interface TXCArtistTableViewController ()

@end

@implementation TXCArtistTableViewController

//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    self = [super initWithCoder:aDecoder];
//    if (self) {
//        _artistController = [[TXCArtistController alloc] init];
//    }
//    return self;
//}

- (TXCArtistController *)artistController {
    if (_artistController == nil) {
        //Initialize it
        _artistController = [[TXCArtistController alloc] init];
    }
    return _artistController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // update view with array of saved artists from persistent store?
    [self.tableView reloadData];
    
}
#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.artistController.savedArtists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    TXCArtist *artist = self.artistController.savedArtists[indexPath.row];
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%li", (long)artist.dateFormed];
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"CellSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        TXCArtist *artist = self.artistController.savedArtists[indexPath.row];
        // Cast the destination segue controller to our custom type
        TXCArtistDetailViewController *detailVC = segue.destinationViewController;
        detailVC.artistController = self.artistController;
        detailVC.artist = artist;
        
    } else if ([segue.identifier isEqualToString:@"AddSegue"]) {
        TXCArtistDetailViewController *detailVC = segue.destinationViewController;
        detailVC.artistController = self.artistController;
    }
}


@end
