//
//  JLAFavoriteArtistsTableViewController.m
//  FavoriteArtistsSprint
//
//  Created by Jorge Alvarez on 3/20/20.
//  Copyright © 2020 Jorge Alvarez. All rights reserved.
//

#import "JLAFavoriteArtistsTableViewController.h"
#import "JLAFavoriteArtistController.h"
#import "JLAFavoriteArtist.h"
#import "JLADetailViewController.h"

@implementation JLAFavoriteArtistsTableViewController

// let modelController = ModelController()
- (JLAFavoriteArtistController *)favoriteArtistController {
    
    if (!_favoriteArtistController) {
        _favoriteArtistController = [[JLAFavoriteArtistController alloc] init];
    }
    return _favoriteArtistController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
//    NSLog(@"%@", )
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.favoriteArtistController favoriteArtists] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    JLAFavoriteArtist *favoriteArtist = self.favoriteArtistController.favoriteArtists[indexPath.row];
    cell.textLabel.text = favoriteArtist.strArtist;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %i", favoriteArtist.intFormedYear];
    
    return cell;
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // ADD
    if ([segue.identifier isEqualToString:@"AddArtistSegue"]) {
        NSLog(@"AddArtistSegue");
        JLADetailViewController *detailVC = segue.destinationViewController;
        detailVC.favoriteArtistController = self.favoriteArtistController;
    }
    
    // VIEW
    if ([segue.identifier isEqualToString:@"ShowArtistSegue"]) {
        NSLog(@"ShowArtistSegue");
        JLADetailViewController *detailVC = segue.destinationViewController;
        detailVC.favoriteArtistController = self.favoriteArtistController;
        
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        detailVC.favoriteArtist = self.favoriteArtistController.favoriteArtists[indexPath.row];
    }
}


@end
